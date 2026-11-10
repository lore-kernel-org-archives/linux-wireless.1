Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794297719;
	b=oLm56lBViFp8s1TnRbESjc55vmasAXXjSV059spYvN1qkLGDipLT628PNaS5J2A92nnL
	 JefWBxTyywJnEJlL7jMbcSMEAp2utsl/emt7D6X8O0NZiGbtKxVz0tqNfwSo3mB2I/Vxc
	 2kmfg1ZdHzlMf6BbI3j/Kt0z+1YN/F0OlRPhcWyB5W+GkZcXDJsGZ/EcE0Z2rclkbRNB7
	 E3O9EZGvaOJmZQLOgISPAJV5seIPjyNlPC5CuBI9glDzef7STZGPQ8jyDAwHobN7O1+dF
	 K8Qs8jl8uIkMwuPr0sFOuI6wqDteu+myybNR4Q+Plv/Cf27ZYZMNmJrrFm6yxGwxS4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794297719;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Ge5RG0Etf1mIICPBU+Fr0TeBQ0djSo3YJCF0Cblf0n8=;
	b=cfv3fBCOCEFBUIhDDG1wUpSMpFY9plm/PSTW21XB80f5vYoSaZcV/N8zW0Ji0AAsztsG
	 YJ16RyQ2X+737NehQrE7dhgiz1pjtPpYsUs7tt/HedNaktQHuhQpZ2EXhU+fwhQew8DZ8
	 iNeCUoYYDur99+VbVbvrfHmVPYJ8f3+ldw3CczhLYoqQkqf2BLbU8fIJafgnFeoRYom6P
	 uHCUBwgqYfXTSKGgLWWP70EPzLVKsU6FrOlwKVrO/EUgGUirBd5Z9/cQoCPZHKv7izVPz
	 AyfqSXw6qmW5KEOWkeCy+YK/fG5vi3aa186O2fCLjNKKhOm6I7lJWNQ/PlB36yRtosQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fFn30jJC;
	arc=none smtp.remote-ip=209.85.215.182
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446E6606B121
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 08:01:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 446E6606B121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fFn30jJC
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cdb9f760337so862350a12.0
        for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 00:01:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794297718; x=1794902518; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ge5RG0Etf1mIICPBU+Fr0TeBQ0djSo3YJCF0Cblf0n8=;
        b=fFn30jJClst/P782GhsvLX4XDdp0cPqaYlBTugmsLdnT/D1QxxuQBWONUrAJLuhR/e
         NHSEZsogPGggOYnFmHJADV9UYC0oc/rHS7x9pxpL+eLzTkB1mgym0DbroTAEXEzyX9f0
         JeyhBLqGRV1N3jO8XnhZhmEqAZDGdNJyKCkV3alSyFSSY7emZHSxRIJoSKsbaQzPRX6m
         Qeq0t2fnf/GZ51oVXb75JG2mI6cVVHOV1LEnneB+50vs0FgoY97t/JbVsFyvn3NSGOlE
         GBwLHn08fybxycKUPw+kF0t/4iORB2SxmT3C93N4aYdzZ3KalX9B6o/v9DFwGpH4VlGW
         eObw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794297718; x=1794902518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ge5RG0Etf1mIICPBU+Fr0TeBQ0djSo3YJCF0Cblf0n8=;
        b=Zpi6t2vntUcrkl5RgGLLlLbpllmd2+IN1F3xDe3ZHaL0tLK757nvsNITsKc1a3hMFC
         bhtHjQGhMM7NLyjMmWq2i6MPAZ85vRxyCaz77E8r628RmLHlx0lPszRF2Ws6+Mpkq/6U
         ByHTXfRwotOO/A0WN96/zzvACK6psksuYm1f+nA20PnTcqd1OfU16SwxWSm0eWAV7Zlc
         JtAUbp4I+x5aKTuNGv0lJ5Mi8wyRxotFt9ffgWt6qlwz9k691HptzsQKtRwBW/9O3vRR
         nTzDasn7gvYhgkgYbqX4Zv8RMb3vFrva5HUHV03B8Ud7T1qSHFp/6pmdmXMgi61dQj1z
         /6jw==
X-Forwarded-Encrypted: i=1; AL+hErFqFdjHMJhvaOdPdnJXAQX0dO9kArDIPBlfKldNif+JLYOxwIlepsTSSXHur2i8DkA74kA625wfE9CuGPzNcA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9QEt5LZ9Kx/LqBg32J7TH33tipFKwxx16dTPxM3zaW0n0AqLU/
	R2StyP7CePsBnZYWGGdYbz6wKWM82xEZwff4phf7Mb76rH2S2lGiBlmK
X-Gm-Gg: AYBFou0bURoMfOUmqOWejcD5C3X1uwFqnP/82sGWLvPSuhrh6y/zj1Nyn1Fx1Lvlglu
	SMSsnYYL7iSUaXp8qwhPUaYS9kKp3RT64YOw5Z/0vWaXAMn+V3hcMFWfftRhrejSGoq3qwsKrpK
	YUiAyG9EF7lbYNX/ZoGPxTGDXAeMAfP3qgtlrvQN9ddNBdkr8RM+sDOnIKoApLKmtblJ737rkGq
	2lqUWhqCkehZQBy5zc2Wv9/vngYyYxJEqTxz89Y+mF3EocNFDrC8g504EPAiPgG9Xz+KUJxvfk8
	RNPHsEkUgSLlEwNKtQId4Zczw9AgdyP4hX0KFTnswWmDyywPeV0dB3Iz8VvUeDyiVuEKrmaH3A4
	6QmpQpDEZwQIT1LUKVPmVpfvSygRKUCbWcFDTLNEL8snyjMAGVAIPW8sTZr7j8DbkFs7YadePUi
	0pCQrxJlQdKrQJPfg1IlDaf8/8x0Ng1eHoO+wj8iDwq1pggDAaAgt0fcoGLDkV3DsQ4jAsSIkD4
	9aH45XtCjPvEtT2ay5T8qeinvEhUEHIxOZyLo+CEm6dYdKq94QZco4TBBsaI5f2NFv5ZbjLZ3nQ
	4LFIk4MHMmtE0bZUN3FUKoA1o8gHsSe6UjTK54TD7ovcsgAX5R8wOVYo84PzrTU5L5iyhS//t8L
	tbiKjSM6G
X-Received: by 2002:a17:90b:548c:b0:3b0:a1c6:95ae with SMTP id 98e67ed59e1d1-3b1679e96e8mr1157275a91.31.1794297718399;
        Tue, 10 Nov 2026 00:01:58 -0800 (PST)
Received: from acemagic-m1.tail4fb79.ts.net ([2401:7400:c804:b668:b87c:eff1:b55f:23de])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1678ceda0sm2906627a91.5.2026.11.10.00.01.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 00:01:58 -0800 (PST)
From: Ho Jie Feng <hjf3108@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>,
	linux-wireless@vger.kernel.org
Cc: Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH rtw-next v2 1/5] wifi: rtlwifi: rc: start no BA session for QoS null frames
Date: Tue, 10 Nov 2026 16:01:37 +0800
Message-ID: <20261110080143.1362021-2-hjf3108@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261110080143.1362021-1-hjf3108@gmail.com>
References: <20261110080143.1362021-1-hjf3108@gmail.com>
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

Only start BA sessions for frames that carry data.

Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
---
 drivers/net/wireless/realtek/rtlwifi/rc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/realtek/rtlwifi/rc.c b/drivers/net/wireless/realtek/rtlwifi/rc.c
index dcfaa98198..f475f1b8a9 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rc.c
+++ b/drivers/net/wireless/realtek/rtlwifi/rc.c
@@ -216,7 +216,7 @@ static void rtl_tx_status(void *ppriv,
 	__le16 fc = rtl_get_fc(skb);
 	struct rtl_sta_info *sta_entry;
 
-	if (!priv_sta || !ieee80211_is_data(fc))
+	if (!priv_sta || !ieee80211_is_data_present(fc))
 		return;
 
 	if (rtl_is_special_data(mac->hw, skb, true, true))
-- 
2.53.0

