package br.com.sprintters.prettystyle.service;

import java.util.Date;
import java.time.ZoneId;
import java.security.Key;
import java.time.LocalDateTime;

import javax.crypto.spec.SecretKeySpec;
import javax.xml.bind.DatatypeConverter;

import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.JwtBuilder;
import io.jsonwebtoken.SignatureAlgorithm;

import br.com.sprintters.prettystyle.model.User;

public class JWTTokenService {
	private static String SECRET_KEY = "f187da484711740d3c86fd374ff10465";
	
	public String signJWT(User user, String name, String nameAndSurnameBase64) throws Exception {
		try {
			SignatureAlgorithm signatureAlgorithm = SignatureAlgorithm.HS256;
			
			long nowMillis = System.currentTimeMillis();
			Date now = new Date(nowMillis);
			
			byte[] apiKeySecretBytes = DatatypeConverter.parseBase64Binary(SECRET_KEY);
			Key signingKey = new SecretKeySpec(apiKeySecretBytes, signatureAlgorithm.getJcaName());
			
			JwtBuilder builder = Jwts.builder()
					.setId(String.valueOf(user.getId()))
					.setIssuedAt(now)
					.setSubject(user.getEmail())
					.setIssuer(name)
					.signWith(signatureAlgorithm, signingKey);
			
			LocalDateTime expiresDateTime = LocalDateTime.now().plusDays(30);
			Date expiresDate = Date.from(expiresDateTime.atZone(ZoneId.systemDefault()).toInstant());
			
			long ttlMillis = expiresDate.getTime();
			
			if (ttlMillis > 0) {
				long expMillis = nowMillis + ttlMillis;
				Date exp = new Date(expMillis);
				builder.setExpiration(exp);
			}
			
			String token = builder.compact();
			
			return token;
		} catch (Exception e) {
			throw new Exception(e.getMessage());
		}
	}
}
