package com.cloud.dream.oauth.service;

import com.cloud.dream.oauth.entity.Member;
import com.cloud.dream.oauth.entity.Permission;
import com.cloud.dream.oauth.entity.Role;
import com.cloud.dream.oauth.mapper.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.Set;

/**
 * 〈自定义UserDetailService〉
 *
 * @author Curise
 * @create 2018/12/13
 * @since 1.0.0
 */
@Service("userDetailService")
public class MyUserDetailService implements UserDetailsService {

    @Autowired
    private MemberMapper memberDao;

    @Autowired
    private UserService userService;



    @Override
    public UserDetails loadUserByUsername(String memberName) throws UsernameNotFoundException {
//        Member member = memberDao.findByMemberName(memberName);
        com.cloud.dream.oauth.entity.User member=userService.findUserByLoginNameAndPassword(memberName,"123456789");
        if (member == null) {
            throw new UsernameNotFoundException(memberName);
        }
        Set<GrantedAuthority> grantedAuthorities = new HashSet<>();
        // 可用性 :true:可用 false:不可用
        boolean enabled = true;
        // 过期性 :true:没过期 false:过期
        boolean accountNonExpired = true;
        // 有效性 :true:凭证有效 false:凭证无效
        boolean credentialsNonExpired = true;
        // 锁定性 :true:未锁定 false:已锁定
        boolean accountNonLocked = true;
       /* for (Role role : member.getRoles()) {
            //角色必须是ROLE_开头，可以在数据库中设置
            GrantedAuthority grantedAuthority = new SimpleGrantedAuthority(role.getRoleName());
            grantedAuthorities.add(grantedAuthority);
            //获取权限
            for (Permission permission : role.getPermissions()) {
                GrantedAuthority authority = new SimpleGrantedAuthority(permission.getUri());
                grantedAuthorities.add(authority);
            }
        }*/
        User user = new User(member.getUserLoginName(), member.getUserPassword(),
                enabled, accountNonExpired, credentialsNonExpired, accountNonLocked, grantedAuthorities);
        return user;
    }

}

