package com.clt.api.exception;

import com.clt.api.utils.RestConstants;
import com.clt.api.utils.RestResult;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.util.List;

/**
 * @ClassName : MyExceptionHandler
 * @Author : zhangquansong
 * @Date : 2019/1/5 0005 下午 3:12
 * @Description :异常处理器
 **/
@Slf4j
@RestControllerAdvice
public class MyExceptionHandler {

    /**
     * 处理自定义异常
     */
    @ExceptionHandler(MyException.class)
    public RestResult handleRRException(MyException e) {
        writeLog("MlcException", e);
        return RestResult.errorResponse(e.getCode(), e.getMessage());
    }

    /**
     * 处理自定义异常
     */
    @ExceptionHandler(BizException.class)
    public RestResult handleRRException(BizException e) {
        writeLog("BizException", e);
        return RestResult.errorResponse(e.getCode(), e.getMessage());
    }

    /**
     * 处理自定义异常
     */
    @ExceptionHandler(RequestLimitException.class)
    public RestResult handleRRException(RequestLimitException e) {
        writeLog("RequestLimitException", e);
        return RestResult.errorResponse(e.getCode(), e.getMessage());
    }

    /**
     * 处理自定义异常
     */
//    @ExceptionHandler(CaptchaServiceException.class)
//    public RestResult handleRRException(CaptchaServiceException e) {
//        writeLog("CaptchaServiceException", e);
//        return RestResult.errorResponse(e.getMessage());
//    }

    /**
     * 处理登录超时异常,返回401状态码
     */
    @ExceptionHandler(AuthenticationFailureException.class)
    public ResponseEntity<RestResult> handleRRException(AuthenticationFailureException e) {
        RestResult error = RestResult.errorResponse(e.getCode(), e.getMessage());
        return new ResponseEntity<RestResult>(error, HttpStatus.UNAUTHORIZED);
    }

//    @ExceptionHandler(DuplicateKeyException.class)
//    public RestResult handleDuplicateKeyException(DuplicateKeyException e) {
//        writeLog("数据库中已存在该记录", e);
//        return RestResult.errorResponse("数据库中已存在该记录");
//    }

    @ExceptionHandler(Exception.class)
    public RestResult handleException(Exception e) {
        log.error("系统发生异常:", e);
        return RestResult.errorResponse(RestConstants.ERROR.getCode(), e.getMessage());
    }

    @ExceptionHandler(MethodArgumentNotValidException.class)
    public RestResult handleException(MethodArgumentNotValidException e) {
        log.error("参数不合法:", e);
        List<ObjectError> errors = e.getBindingResult().getAllErrors();
        String tips = "参数不合法";
        if (errors.size() > 0) {
            tips = errors.get(0).getDefaultMessage();
        }
        return RestResult.errorResponse(RestConstants.ERROR.getCode(), tips);
    }

    private void writeLog(String errorType, Exception e) {
        log.info(errorType + ":{}", e.getMessage());
    }

    public static void sendErrorMessage(String msg, HttpServletRequest request, HttpServletResponse response) throws IOException, UnsupportedEncodingException {
        if (StringUtils.isNotBlank(msg)) {
            OutputStream out = response.getOutputStream();
            out.write(msg.getBytes("UTF-8"));
        }
    }
}
