package com.diego.dao.usuarios.custom;

import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;

public class CustomUserDetails implements UserDetails {
	private static final long serialVersionUID = 4226188154444084249L;

	private User user;
	private Integer userId;
	List<GrantedAuthority> authorities = null;

	public User getUser() { return user; }
	public void setUser(User user) { this.user = user; }

	public Integer getUserId() { return userId; }
	public void setUserId(Integer userId) { this.userId = userId; }

	public void setAuthorities(List<GrantedAuthority> authorities) { this.authorities = authorities; }
	public Collection<? extends GrantedAuthority> getAuthorities() { return authorities; }
	public String getPassword() { return user.getPassword(); }
	public String getUsername() { return user.getUsername(); }
	public boolean isAccountNonExpired() { return user.isAccountNonExpired(); }
	public boolean isAccountNonLocked() { return user.isAccountNonLocked(); }
	public boolean isCredentialsNonExpired() { return user.isCredentialsNonExpired(); }
	public boolean isEnabled() { return user.isEnabled(); }

}
