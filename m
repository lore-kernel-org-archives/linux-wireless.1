Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794541536;
	b=dj30vjoTIjFaxWB3ge87gYKLKWYTxDm54mK0z/8fBelbEq76hFzLX62mDd/rrfAJqDfC
	 mHrI4DBvDC5Ex939uPi3JmhvJ/hPiVNDlwrxDUXflsH2LD0jpZviYhGWEf/JYakZWQfEj
	 oGI/HCCZZg/AFSITP3ZiwUWDLg9NNrdkObepJ17FKirhAzS3qVYFDt2LsK1LeaZGSYp3J
	 qUuYdHbzi91BXjsPg9xmYIX9XRlSbgKJJuti0Q5e64D2ha54O6+ApsZSr/5mMi2Un5BmS
	 1rCmADWq6sYUBAM/e3CUKEIAphFfhrQmLAOArNNoqu4uUFdz8g1cA2bM/h5m6ao5w3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794541536;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=n8/AvnXIrx41eK9Q4vRZzMy10e9mFZf1Imdul4D70qQ=;
	b=nWAE1/Wnhmgh0sSlwAARy+aVA6lTaLuZnEiDjcX8w3eWMiJPHwHwGtSb81771HI/PIeq
	 ujcj4QVZwhA+5exzBAnlrm1FKOWJKm2UHDOyNJivEzP0Y/8+WaKeuyL/ZjK8KsdQFqkDH
	 PoU/nkRV9G/RIFHe/SHRrcQJXj03DngNBVEA1AS7RzC8UjXYX/cyxyRxWs8uVQUU9gYvl
	 55yu9XTk9K0gNw+fi6ne0+hldV2jVXOJ+F0QzMDhxeXWd42nzl2YloUg2YtOWTyQoUq+g
	 dUm0Om7gggdlpm/HRvx+hhn1Y6JLa/Dwf4hPLRDYrlraeboql9+pVjxLRHSoYi7zJMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ALRQwpx5;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 652F5606A323
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 03:45:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 652F5606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ALRQwpx5
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3712b6d9843so542264eec.1
        for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 19:45:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794541535; x=1795146335; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=n8/AvnXIrx41eK9Q4vRZzMy10e9mFZf1Imdul4D70qQ=;
        b=ALRQwpx5p9tM+6YF3sXHZuNicR5nyD9PRChHqxHRRriNug2muZeqC8G5pM4nNWaI8l
         iRPctIMc6xo13YSHAVIrwkBINhyWjEqligELmxKO/juIafzkdHDg5UEyNzLEf4SgavTc
         agwmJ7I7y/WMDUWpJ24NadxXVeBH0xz4GuBIoJirmzzh84kk6+xVKg8PGACj4SsPogTL
         Y3CEG9TOYYjUpGT/Yo8/kOSEvJa5BDDaZysZK5PaB+FnmRdL2dbxjeFMOBy3OtIAAaZP
         ZPGHWWFKuaWiKIcFMb/RvOKnr5IQfrdk3xKIpmAX6hTOMq/XgMlT0XtiBvMHxicAQngT
         FyFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794541535; x=1795146335;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n8/AvnXIrx41eK9Q4vRZzMy10e9mFZf1Imdul4D70qQ=;
        b=ybd7kl92NTLka041ABvZiEHEfqu/Lf+AO4Vx0QIS7uOaK7bTsLdyRzraCjP3ih31Gr
         3sm0ZHA3zIRgsdyKocFcY2SQxt1/5ULHIh26AL8TM6qQx53HdjpLmQu3Os0GHdep88Z/
         uEwcGxPfTGPGyJATxwmb2Deta1hwNIuHHKBJCvwha4+Wnuu2j9HddAS3+AlBEf4dYQBx
         3KSbuJxhCcCAS6JVcnclXPq8FKSnzg13uXUw+/mI/afay5twc+0HXBc3j3lEnfUeMBSD
         XN3op//ZD5Rk6B7v5tyzSHkUiJRpRCU2sA3FlLMks71RTl0BhFBB/AaJT7WNZprtEYyZ
         9kuQ==
X-Forwarded-Encrypted: i=1; AL+hErF8j+xXW6sLx6Qpbl6ZboHOKk7XKpH2YgV8RhA/noR3VxaGrh6/rTPFULatjymASV7CbT4R7Dh2NtIDjX8teA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9K8k/MReh6b71pr2zij6k3k8jyllrzisxeWMSIFsYPFIrtlJ7b
	PmeApP3ETTjAu4ILja7pH0Q8lDlTAUIcjyaBnRJRDWwGvmq2/b+8cQQc
X-Gm-Gg: AYBFou3ds5sq9rbdcLNJeuht9R+PffspNBqUR2RCi2bgEeeSZILmTZjxdNoRhfjiShz
	VnPhSDAWL0z4TJFgHPhPjmYxqEEB3r4rVBFn79VoG0vJUXNT2AVVroiu7kw/BQ6IUzdjJcKVWjp
	BpJpas57JMVJQFPU1ir007vbH+f6nKTt2fO+3tGoy26Uf7W4VZRNzZ/PKlGEmlor22Q6Q3FtTqJ
	tGbNT05DCV+rljFbWxeK1TR8om+oRiKesdOvOL1R28kzBHDGU+ZdAefD7emRCcrcb+LOdHr3mPm
	VL3kcSB3KqvcrecupsjsX5Hu1fm4O+Jqjw1XVbuzXtctoHky/udm85aLUzVuMXwhSjGYZBTvKTd
	/f3H1QBwE1eyZiX7wiEkmWbGmoRq4B5mggQJ7M+YiVYnIRtUAtvVanWTytfiiT58v2XP9O8l0gf
	63rQgDjaUiMup/baISQjYze36cijjYulrPe7h0amRbQifQEI4siwc1yVGWK5qGWw7KM5O5gY5/H
	nsD4U/XtJS5dO3ei4NH+ME32EnUsgC1euYQeAKn1HfxiuySNBrBVUcaiZqEyG6Oh7cJ5PyD4/hw
	89l8RwY3Hc2iLz82njHb
X-Received: by 2002:a05:693c:8084:b0:378:1191:43ca with SMTP id 5a478bee46e88-37966e3b292mr1138076eec.18.1794541535230;
        Thu, 12 Nov 2026 19:45:35 -0800 (PST)
Received: from xploitoverload ([2a09:bac1:36a0:120::243:8a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955332ae7sm6099607eec.8.2026.11.12.19.45.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 19:45:34 -0800 (PST)
From: Kalpesh Solanki <skalpesh942@gmail.com>
To: luka.gejak@linux.dev
Cc: pkshih@realtek.com,
	kvalo@kernel.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Kalpesh Solanki <skalpesh942@gmail.com>
Subject: Re: [PATCH v5 2/3] wifi: rtw88: skip already reset station in rtw_sta_remove()
Date: Fri, 13 Nov 2026 09:15:08 +0530
Message-ID: <20261113034509.20282-1-skalpesh942@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Luka,

Thanks! I've addressed both points in patch 2/3:
- Moved cancel_work_sync(&si->rc_work) before checking !vif.
- Cleared si->use_cfg_mask = false alongside si->mask = NULL.

I also picked up your Reviewed-by tags for patches 1/3 and 3/3, and will
send the v6 series shortly.

Thanks,
Kalpesh
