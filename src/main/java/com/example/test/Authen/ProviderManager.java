package com.example.test.Authen;

import java.util.List;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.context.MessageSourceAware;
import org.springframework.security.authentication.AccountStatusException;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;

public class ProviderManager implements AuthenticationManager, MessageSourceAware,
InitializingBean {
    public List<AuthenticationProvider> getProviders() {
            return providers;
        }

    public Authentication authenticate(Authentication authentication)
            throws AuthenticationException {
            Class<? extends Authentication> toTest = authentication.getClass();
            AuthenticationException lastException = null;
            Authentication result = null;
            //for문으로 모든 provider를 순회하여 처리하고 result가 나올 때까지 반복한다.
            for (AuthenticationProvider provider : getProviders()) {
                .
                try {
                    result = provider.authenticate(authentication);

                    if (result != null) {
                        copyDetails(authentication, result);
                        break;
                    }
                }
                catch (AccountStatusException e) {
                    
                    throw e;
                }
          
            }
            throw lastException;
        }
}
