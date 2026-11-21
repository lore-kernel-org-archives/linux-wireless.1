Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795279601;
	b=mlDVcfGdK50/w1ic9JHR/hWCh/AL6XVNPAHSaiieHAcTI7LtM1zIa+zTpe8trPmcAS52
	 7LNRAi1cswv61LhuYVBV4D6CaeDsA3JCRjuqkCnbIn9YFzKdUeTEgPXOj1Im42qjfkJAz
	 l11a0qQlXpcvptzmSYbJg5dOxdXjjbI/rXMZiomIv59k+o9vaZ9PIu64h51+uyqT/QRTQ
	 ttdGtWip1mxIrL32S3oA5h2cUm972HH+9Tg/0y656neyb6l35COMERQFfnX1s/MRf7GYJ
	 RfpbI8byl71sZXth+CSfWmL4utu2hgqJ69JcscPb3dPxSqhE+O+l7O8uXurLleiFw+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795279601;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=P/gSH84W9nTAHSSAJ/t1/ktXrTVBa/4q/QfiolBhcqw=;
	b=fsOW6Dz2tdBzqagn1KSteOAE6MsHNzy5JvDVbNhHCBDue+0j9coYWfzQ2tF7yABeNKki
	 H3IeRo89DhE6xSDhN7IJlXfvsL0CY/XNGdTwZIUIuesxQFf0b0lsWzrcxz1onjNlDdEIr
	 YSfg697mOqH+PKzrA7YSq78/sehVk+U/iOVG1xPGesiAiLycaXmydKur9PFc5+a2ObEsC
	 +add//YmaLGhO3ihWF6NVrrrUPPrvlBs4c/OG8fM2s9WE67CvgelNxW9GjUdzWHr4kXFd
	 u+sB9YC1icSfAjqh3cTQnUuBbzQjEVKLuWDfUCc+/cNv7aWcZmImO9T4oY616/k2yyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=JuGADNsl;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6175606A330
	for <linux-wireless@vger.kernel.org>; Sat, 21 Nov 2026 16:46:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6175606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=JuGADNsl
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c5133831027so282593466b.2
        for <linux-wireless@vger.kernel.org>; Sat, 21 Nov 2026 08:46:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795279599; x=1795884399; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P/gSH84W9nTAHSSAJ/t1/ktXrTVBa/4q/QfiolBhcqw=;
        b=JuGADNsl9TUMT7yDaFS/ab9hGycHQVyzfEYELymbXEuLx0NmeYYvhpljikqtxMqPPG
         ZGqNweZLvfa8mMiCL8QCfUjjJ+UuTrCqgC48uZKPlb9mr0daTQ6yQ56Lq/jq7xZlIhkS
         gO/WOYZovZ/nmV94m+BnEMbh+bqFQiIKCnl6umDl9QNIrepWA4yLc1MkPQCoe0WbH/RZ
         oYDkChPQGNiPzjoYuy7iQP85D5S3sZyW1GsHTC5+9MrD5UUTQlDRD0/J4HZT1XuoBLEc
         l74DhbY+RM1PA98AMIBjHE6CCOt2EQVvI5BrlIE3NPlQWPkpmRV9Nx3csGCgrLiDpGBD
         618Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795279599; x=1795884399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=P/gSH84W9nTAHSSAJ/t1/ktXrTVBa/4q/QfiolBhcqw=;
        b=DB0ZhSRjmK05CuIcEFyBs2xq0ufEORAgu+xByd4DiByuRyqWcByBtvN2vPBBqhNdXR
         LE9SYP7ElTE2ivFoSesnJQacAJ2twYmV76ZVj0WbsZpIamLFB7HKa91AR9mmhALZozh8
         vT5MzoK+YoNy6wAGIctPNDh+6Bfln1+n6sXEdbov6ADuN1kRXDx9sIw0zWME0u002Abw
         m5s2acVkwxSj0pmLEVGDM8rgryHJFm/tRK/1P2N+AhpP8VtyWeJ5jEy5qN+M/NdgtCG3
         XBHIhoViyRQPHXVILnUlWuThXXt//Bbpse/YP4gr8+5egyrgZ9o3yvMPa+7wNiASAAZk
         cRhg==
X-Forwarded-Encrypted: i=1; AL+hErHmWVKNngHWltVMpTHXT8ngRRE6mkCw9Sud5q7F5gxy1aJiZ9M2Jm1Z+HMxA1ksGvNgqoaFN6/SLbolWvjrzA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+37WD+ydwUKNyLsmqTozJyXL6NHMs007SiZuN43UrvZDenOObP
	4y4OzPy/t/cKgYKDmxg8XEyijJHAwibrhaX9P/R4m9t9rO3dRa7efXQzq20Y4wKEX8YPyVpzRwG
	0yNwaAw==
X-Gm-Gg: AZFdTZcA1Rq1mIAdA4Zx1iEd5QbPcuwWDQcPb9y/RIwquN5N2P7Veo0NeYrKpnQ0R6V
	VP/OVegBqRcMcgX+0FBmeEwaQ3QN8B2BXIG5vUIwMFNN4VS3HsMWRhI5THGlCVL9ZBH5m2OTqJk
	biE3Qcn5d/rAnzPDuqj4MORFxlOy4cl/d9ky9YJ+BTCH4LhDlXWaeZpuVszGUXcMDW4WoKeW9ox
	w0hCa0H8nWMSS9IKZ6WT4ZaOjMifv9goU8FOzhAfT7rR2nIIBQpzKXgSgM/QDvLsuqViYfJJaUM
	cd1WUOQMmz2i37gIaa0+iZlGUH+GkfevrAMKRXVmlieO2Upm/+438Cg2B/8QGrWuGjXJRtqtzEL
	WlcCSX3XjD9GG944FhQE7yc3ElRAN2F0ReGHYK4ZJaaQq3azby9KDH+0Uz2DfAr/8aJJ5NJM08z
	fKrCBu1wEfdq/hpEqivGuDVRoIDBxi/5X8GdViFr5/RSVP3Y2XonDeYd/NffSOxmrhw68SVfnkk
	FfytJp6gpu3wkrUaTiKtJjKZ1PknoGjoAGoqfEPUKIMbEgYJSpfVr44CPO3SKgZAbowx105Z0IR
	XScZBsihzDKwpBXEbmtTiVLLbU/gHkL6/OfWWuTw6frDwYmeZbCui0PO9HJk2DZc+/ppnATkfBF
	YswEeUwBg33ON1JijtQHG4aMnRy9PVvkRidw2RUB/Uc8uRyGNr5/Jt5eV++XoKb3XjzId2I3Dqp
	oy9X8qOLlzTFrw7VmAixmgjWWT/waYeShNBkcEPVOX134HZLHAkyv9rSXdGycA3kybMd5cmAr9l
	fl4fkaWt4ilQtN6UFM6gZRX1FtdJjmQ1qqfWYgW/BTaPUXTyLb4e706XLOT2Ud/irsix+TYJxHl
	open/hDKl77ImTzxY9xBbvbe/ey8EPAoW20phMbyTZjs4trAojv0zm3S9BjHLq/2Qjjv6SCJooq
	cMg==
X-Received: by 2002:a17:906:3e1b:b0:c50:93b6:52ed with SMTP id a640c23a62f3a-c513aab27ccmr426031766b.40.1795279598346;
        Sat, 21 Nov 2026 08:46:38 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f2470da3000000000000000a27.dip0.t-ipconnect.de. [2003:f2:470d:a300::a27])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae8f70fsm213796366b.40.2026.11.21.08.46.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 08:46:37 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: jjohnson@kernel.org
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baochen.qiang@oss.qualcomm.com,
	vasanthakumar.thiagarajan@oss.qualcomm.com,
	rameshkumar.sundaram@oss.qualcomm.com,
	kvalo@kernel.org
Subject: Re: [PATCH RFC ath-next] wifi: ath11k: advance the TX PN of keys reinstalled after a firmware restart
Date: Sat, 21 Nov 2026 17:46:36 +0100
Message-ID: <20261121164636.3949260-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261018210212.1926073-1-julius@bairaktaris.de>
References: <20261018210212.1926073-1-julius@bairaktaris.de>
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

On Sun, 18 Oct 2026 23:02:12 +0200 Julius Bairaktaris wrote:
> Which command or field sets the TX PN of an installed key on this
> firmware? Without one the stations need new keys after a restart.

Please drop this RFC. With key_tsc_counter set in
WMI_VDEV_INSTALL_KEY_CMDID, WLAN.HK.2.9.0.1-02146 still started the data
frames at PN 0 after the restart (1 run), so the patch does not do what
its subject says.

Julius
