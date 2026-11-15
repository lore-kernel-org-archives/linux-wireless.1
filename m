Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794743770;
	b=rHcGsVjnQN7kufEX1FNqSLEP0kMifeZbQJwsPSwmFB1vUaUG3N6GkndRscTeEtqiJB/z
	 IDYpKNl4DSty62T4NazQV+I7yEzcTD8U0HDhrtO9xaYR7+JFQ8ZLjunaootkm4aDU8amF
	 3W6C3OO1/0r1ZsuPbO4MdXgC1puNBdf7KNSxzKQpePjMPaiptRqBzc9wkigoI+c96d6O0
	 z1BwUxoSnDG2EwmVFFm1WlWfz0y1JP7Xbgi2KdvXB57wxjwNToWWAhgPLXginiWxVrf01
	 lBUf+ARrYkqy+FPRUAMkjl1rcwNCVA0kxWbd284zQdeYl0DBVL01HMRBFjRwBCaJ2Mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794743770;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=a5UPKbjeaPw7wY9xTmJ9YNuUlgr3mb8CPRr9BZb3ueU=;
	b=CILlbAlfCZsN/IxvDZe2bE422LlFgInVmcAaSEMRoP7TwPk8S5aY/HfakkDnBRADFoD0
	 VM/Ijo+vE1eMU4+wZBlBTg3ucB83ElHGdOEVHdbr2rEQiCKSHWnWOLytcbPorIwmwnkfM
	 FoNTAWcYvRSBEB+ySR3eVHvtieA6BWubJQJy/yx5Zd0pZmTrIGCjDhcc9bWIWHHTxwDJP
	 5h9wUEgLQKwjhMJ4xyFHckIvb1OHTMkovQ08MYLRIfavam9rws8/KUFsYglpzGpDOfkkm
	 0Y6Mu458KQMaZxr2Besa2j3+yz0YWX/f3LT5n4IvNxy5Pv5pJq+BQLrIFy2QjCRqXuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Tz4TNrH0;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 081F1606A32D
	for <linux-wireless@vger.kernel.org>; Sun, 15 Nov 2026 11:56:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 081F1606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Tz4TNrH0
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3ae1b34e0d2so1851691a91.1
        for <linux-wireless@vger.kernel.org>; Sun, 15 Nov 2026 03:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794743769; x=1795348569; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a5UPKbjeaPw7wY9xTmJ9YNuUlgr3mb8CPRr9BZb3ueU=;
        b=Tz4TNrH0Yx0Pyd4OwiFfRzsZ7irlGRKKhBrKALoU5QPFaDkTtTriYP1WDKSh2Yd7my
         8VKvnk0bK8yjdN1SRukUaaIDzZZFZ5YOy5XfPsZ8wjlC69QfE+QGeH4Cn9KTiV9fNPII
         SxTCEPSM7FEeM46qWdD/OA05OdcjBVu23BWSl+KNUP7KO7VoBlOiqA6ojpfRb32sv9cC
         px5xQKq8e1+NCAKV5oIperMHAaLk7ma/8PRR08KRk+tpASXLsB59FBS4L1zMaCNYqu3r
         qHo04TFSoeQi9gFROKY1wgb9xh3UdzxEcRmAwVRwUFck+psQnFu7jBfa7G9hzjxz19YY
         5IHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794743769; x=1795348569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a5UPKbjeaPw7wY9xTmJ9YNuUlgr3mb8CPRr9BZb3ueU=;
        b=LGj8iBThH41ieEozDigZ06iPM1yT/gbBB7gqZGkc7sVPtF3g7krtn6vrGJwegnWc/1
         lxwwpMQPUN0eHjB4RgfxU5Fo1qRwt2A3Hd45b94PAA/hsrR/5lGTYC4/CkLzAxg6zGl9
         zLaVS6P9uGtKyYPJur6x+OjUjeYR4klX2o6gjxyW9Edeg3pb+oqrTp7FLiN0qbkkda3f
         xu1/r4HG9jx4xpCWOF8m5ICmAEBLV6uBrt6Qjpc1pf7P/p40VfTzTI7H567lp5hrvWSF
         zrq9n5m4awr1AshGdC+D1f/0VyUXZbs4L2AUojzupFoZEuI1OT46CHmC0+GGufcGK5Tn
         XUIg==
X-Gm-Message-State: APuU4Z9ghCgDcNPGPxysepm7sNUdzPwJeZcGzzZruDHpKu1JBrOHsivo
	T2zy7HAiNjrQRpk1lk6utyTE2Wclvq8CGU6AVCebH2fRRwhB+A8Tl/ep
X-Gm-Gg: AYBFou1UhwQzXippvehNotcVQpFAM0K3MkiA59kgzPNsVLukCTBM3a76qFdXRWDtchF
	q6nUz1Ovfry+JEgKGMbZkV+nK341wy+XWSKSuKc7J/is8an0M8FTVE9zlCBa0OtPHrqC+cONcA9
	hVwwnGwf3WBV555zEB+5+cdrjxIXo9CrEjSz6G7Z6hryRu29yVNgByrLa+850TDSifpnhFOmSvD
	3yTMYRIt05rkr+d7SD6MHvQgjYDhUkA5aZI3CcePCKy7W8O59xCu6oldgyans1GyxV1N+7vDQNI
	bg1AJXXNrCaz3HCDKBiszJPMh4pGxiwhum/nXac+d3XQ57SpTaGtzZahyZHobOMBG7S8kW/h8NN
	H+7Y08SMM6snwCsRTzelcJdsXw2Jt9tQg0michaOCSZxhku5PR503nxGlB5/2cnc35zOohxpaEA
	sp/H8B0maRGfGs0hwGSWPSj/wSm0yzBBmPpRB88ind18sSqzRtSOaYQXf0EON1hG+ihQG6AnRxm
	u7VvFzLuAxW1czZrIb78nn7eAairj0hxTvouJt87jDvhrHWQB0cyN0dQ22jFl+4oerm+AXg6bi9
	36D5jt0gUgQ9ZGGjnB2W07XWIvgiyh57O08speyUlxA6bPxkMuaPVEyVt5Wkxsr3aTHbVPoqUrp
	fiaf96zWaCJxG2XrL74ChIaa6F53Y3n4s2/zheqruMrk=
X-Received: by 2002:a17:90b:1b02:b0:3a4:b509:88bd with SMTP id 98e67ed59e1d1-3b1b087c16emr5013019a91.2.1794743769234;
        Sun, 15 Nov 2026 03:56:09 -0800 (PST)
Received: from acemagic-m1.tail4fb79.ts.net ([2401:7400:c804:b668:5ade:5fb:5602:326b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b3ac294bsm5853901a91.2.2026.11.15.03.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 03:56:08 -0800 (PST)
From: Ho Jie Feng <hjf3108@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	Luka Gejak <luka.gejak@linux.dev>,
	Ho Jie Feng <hjf3108@gmail.com>
Subject: [PATCH rtw-next v4 2/7] wifi: rtw88: skip the dynamic CSI rate without a cfg_csi_rate op
Date: Sun, 15 Nov 2026 19:43:28 +0800
Message-ID: <20261115114336.1739863-3-hjf3108@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261115114336.1739863-1-hjf3108@gmail.com>
References: <20261115114336.1739863-1-hjf3108@gmail.com>
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

rtw_dynamic_csi_rate() runs from the watchdog for each vif that is a
SU or MU beamformee. new_csi_rate_idx is only written by the
cfg_csi_rate chip op, so on a chip without that op such as 88xxa,
an uninitialized value is compared with cur_csi_rpt_rate.

Return early when the chip has no cfg_csi_rate op.

Suggested-by: Luka Gejak <luka.gejak@linux.dev>
Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
---
 drivers/net/wireless/realtek/rtw88/main.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/realtek/rtw88/main.c b/drivers/net/wireless/realtek/rtw88/main.c
index e243738809..a8a603aaee 100644
--- a/drivers/net/wireless/realtek/rtw88/main.c
+++ b/drivers/net/wireless/realtek/rtw88/main.c
@@ -174,6 +174,9 @@ static void rtw_dynamic_csi_rate(struct rtw_dev *rtwdev, struct rtw_vif *rtwvif)
 	u8 fix_rate_enable = 0;
 	u8 new_csi_rate_idx;
 
+	if (!rtwdev->chip->ops->cfg_csi_rate)
+		return;
+
 	if (rtwvif->bfee.role != RTW_BFEE_SU &&
 	    rtwvif->bfee.role != RTW_BFEE_MU)
 		return;
-- 
2.53.0

