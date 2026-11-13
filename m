Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794607547;
	b=pYBfJPdwxDY0V+sYEWNxW9xS41q+6OilLu7z9sUCJwp95hLESIj2crMwfYfDfFA68dVB
	 KLkQrMVvf9Ft1vaZxUlXiqbVJBUq+UJ6ERvbSWvnpypA2JxSVuztUFAFted4pGB8zUcVg
	 sRog7K8cpdi2RgXykFsfSnUCIOHlfpgsqCFYv98ppCEIpwuk9GpIFRo3fDZa7p42Qsb6M
	 ukzPveQpcLfZ2bPX6N8ZpJM9Lu6XsKMrTy5GLO+rl9klNGZjJ255J+izDcfWL/chzo3tz
	 9oa7G+VPEuhCzC0nX8wqQVE/pTT4emX1OB+aTR49uOqVAv3bD5mzsTHdQJ0Ng8E4GQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794607547;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6RowVT2Xo1NxyJ1M7Sp9VuAoN0rAdPrex9DVd67tr20=;
	b=tMsddFSKYr/KvG0LXQrLwOy8QHaQKWomV1cBrGcd2puxr9V7Tv1LBDf7s21baPLFnWog
	 hMWoraQbMZe6vmp8d3RFl05mxXeMB31QImvV1FJ/sd4Ku0qnTUCe+Gufx31lgUkwtMuW/
	 nGEugIaShg9tk+mQuY8aflQ+Yz3lY8o5bs18EGvgR/dMwgv3J6/dz4mVyRbcUyXjCVyaJ
	 Itbav4+JOYMARU0nYMafLs/Pyf1jS6zvXT4iFsMiE7rJL1nLgQW6mvYaFeuZyEmv2UmAV
	 Eo1n4P70ibdJdsBqZ4dPVE+zvWlMMZVUQPd764ZBsUiG+Nvl4n4cpxCrKj3JHvxdMEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Ee/Xv4Ww";
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E39606A323
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 22:05:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66E39606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ee/Xv4Ww
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48e09aa5264so687250f8f.2
        for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 14:05:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794607546; x=1795212346; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6RowVT2Xo1NxyJ1M7Sp9VuAoN0rAdPrex9DVd67tr20=;
        b=Ee/Xv4WwOW2MVfLKhKdapsxwBE6D3haIpCxiQ0Eys9YO+HPqJqP8M20lfxyB+GjOt0
         +S41TaaFeW0NWD1fu3lfpImHFCgVkvrJKv1w6mNk/tn8fAwosew8ngGZyK8gA2DTzucR
         F9ccsLgNk7wWM6+K5K8WPADtv2mwtqthtUUCTTHAx6tAClz4SO+Iusd6D82qZxdr7BHu
         hpBcM1iICi2AqS66vp+65rD7sZHgIu0ukRSjoa6TbRbLSx2f33zdfIb0FOdptntUzsDW
         Zd8zUbiTIVsuQNGwmtIa/2L41QFKtuhnadTM8U/p+Zra7xSHc8zAogTHDbz8KdJVr9ln
         4MjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794607546; x=1795212346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6RowVT2Xo1NxyJ1M7Sp9VuAoN0rAdPrex9DVd67tr20=;
        b=HqMvSZ5J9dTUQabp+W7J7K5rw9VzSdgy+IwfwsqJ75QUmEoYYrsoO+ZtEY1lSke8k8
         K2JUz8dhF6HHCfxvJcLov8crDl4VkGvbK7MP6OkwDV/NMwANsEkOtoFWocJ8kVXSNlGU
         i+BY8f5KJHneLLH8Cxn6H6rm0qj/nDTHjNq2Nq4EVYK9UnRCAHhXlKYqZfWfJk0YizjE
         2GoBRRX+sdReTe/k9Zb1USQtOnYsfJZ8REz65DYKrdnMh1sudlk2YWdpMioLQdY5FNVv
         6UHh9lnuGmlR4j1jGmUezd8BEF/TiuYc5z4V9htVQjdNI8nO+yG8MN6VSOZ73YiZ1KyV
         Qkqg==
X-Forwarded-Encrypted: i=1; AL+hErEOGjVPkregojEHYC3GbfPVIEiKVl9JHjpyUxYLdOO6C68+yOJyIEnlPNV3WFo4ipQszLYyK9Z3CKh4lFehUg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+z6uEE0O97NVd9O6h4tpUtkHa5LzeGE2ZqaTjtK48xtKO/Yf74
	YUdKlGf4n75X0sEgXjjmGpAQCqGKWC+cWSMf2uGubehnB4eYDMKq495itxg4iYvL
X-Gm-Gg: AYBFou3WRtRyTCCYmt8/hgJTsO0++2vc5a1A7PS32TwhSSTzqH97G85RiPwr4vQb5F/
	L07hhkLfVtVtYY44hjVhG+SquDEB1aG1XmxjaL7zjE3HmHTP3sZBZA3DQcJ4mkdiTde97MZdY1O
	hCOebDEe81sR20MOVp9Ec/6VVKyuzH3xwIgeQdJZdVEnKouZOnCTn1z6Iq+YANuiJFYNwU8UGpd
	yUl/8VAFCpqBjCwzy6/TBCoEfPRAv49BwtCuu0x2tyzldG6puzdJZhPd5z12T7FXAeVXdAy7lqx
	prPMNQ+3vuiI8oxJl1rbl30BOi6qUJkm4WVHVxQ8r5xVsY/h/2Kl4kr56MhyOH4gMY4YjCtqrSx
	/Yz1DrG5o4zqQGP4Is9CV3My8GknWxTxJn9o1B5WkmT/6LFdu8MKU90ckj2yf3Lm7lh2uZ741Kx
	SqWgnVU8nR2Am/j+tZavVFozYtzaj0nkorW/LGDIxn26Y9Tn6dzcehyv12geCd4TsWVUQGpX5Dj
	Y6s3ydaJUpsozWN3p8tUMu7G6fCHqVulDd+HpdHLHVlSNSAZOqWPMwdoeZJVHUkQ9wgyQNubYnD
	ze6FmLqYfoK7MeJ5hFCisdJZ0z0fGNFgPKg=
X-Received: by 2002:a05:6000:2c04:b0:48e:d36:77 with SMTP id ffacd0b85a97d-49c6fc9db5bmr9022706f8f.4.1794607545676;
        Fri, 13 Nov 2026 14:05:45 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5fe373casm7238049f8f.30.2026.11.13.14.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 14:05:44 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Luka Gejak <luka.gejak@linux.dev>
Cc: Ping-Ke Shih <pkshih@realtek.com>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: Re: [PATCH rtw-next v10 2/3] wifi: rtw88: support channel switch in AP mode
Date: Fri, 13 Nov 2026 23:05:43 +0100
Message-ID: <20261113220543.826489-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <F9A94BCB-D3DD-4ACB-AEA5-118611FCBE08@linux.dev>
References: 
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

Thanks for the review.

> Maybe drop the op and say in the comment above that this path starts
> the countdown? Or is it kept on purpose?

It is not kept on purpose. The BSS_CHANGED_BEACON path starts every
countdown, so I will drop the op in v11 and say so in the comment.

Best regards,
Mehmet
