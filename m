Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794506226;
	b=3YGdcQgsP2AFGe0o1sVamcnF4FtdoYggCtobRH81O1oywT4PXw0wr1PzF2Ye8j4cHc01
	 Vyt3L+phnybZdu/ox8wXtCZIBa8KW98lPemzUrr/+eY4T53PU6U7TDZlXTqLxQHerJKTz
	 1/toE7O0+lmg1uL59FM9b6oVvc6JVC6v3+RVJBWj1OuMswZaeqvW6u7/SCZ2zvKkrue1u
	 hOXph2Z2nkY7O/q12uO3kCmqJKhvy5TDJvDOEkHLFDHy/hrrruoDAT9PJyr1Z/MZrq6XX
	 VxdmL/CyPUYBSDhaW8bCCU5Pn2iXVkUff2SCBmFMtRoCAsKHz6cTWRZ8xDevWBzjN7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794506226;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=c2U1ozXjTAQOgzzVeR9AQpZIkT5n1EJnb4FCuDvRTJk=;
	b=37eLPBBIMhnahLds1u1oybO7axMOKTA6zsB5rWnx79dUyLC/qTgd+TCWLWr/efnBdh+S
	 jg/had4xfElsRqwGckWKWFH21Gzkdw2OPy56vqzLra4/MhSIOnJfW6ztJoxWG6SWU0Uni
	 99G42Ah1Cw0gi5wp//iDi3VpHC/cBU6bDc39JyXJQA7HvMm0gsy4gRCrlSxfGl0cGmoJG
	 JWdorhtfGBQCf0Eio4nrsKjtFVzUeOm232QvN/DZbyONyUE/ZoWP6oGzz9tlml/h5bpgh
	 zDWA4QTbaen9+W5ff5iJdT3QEw7vbLXRgLCUrVUhYOxbeK9ffAeM4jGMNvOK/+ZukZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Kni8Y7NV;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 802FB60A6F51
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 17:57:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 802FB60A6F51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Kni8Y7NV
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so748895e9.1
        for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 09:57:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794506224; x=1795111024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c2U1ozXjTAQOgzzVeR9AQpZIkT5n1EJnb4FCuDvRTJk=;
        b=Kni8Y7NVEZhLlGNl3R1GkxCoWpyzu8yyz8lYzwjnUsWYFJyXEM33LEgcQUTfy6IFB+
         RtTVBrj3LVbjZ3Z2OYemk2zi07U3VwEMnhUiDlI/s6ARkiShhLDbqC4QgHFdUwUddQbW
         YuB5qTxk9J0jOkvDtTePfFb9HZUXz3YtJG3quEEqY0/fx2NAb5EyNf9iNr6zp+BU5+pM
         K1M+tLA3RphuIL1ZX069pJz+oOAgTD0AK9oAk/Golbu6Hb+UT4+Zfws1rQClV+mYV6Ki
         u6OIbA52Btw6OZFLs+WdcVfUKMC9W9qoq+A/LF71U/C/6GDXJBOpVmpQlhNgUbqJCHPA
         I/yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794506224; x=1795111024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c2U1ozXjTAQOgzzVeR9AQpZIkT5n1EJnb4FCuDvRTJk=;
        b=aVRCdR98uv5/Jet3K2SnR8ytNyYOM5oog1tNBRzZJx86o2/Li7OksAyl121zv1s4xe
         vxX3YGfnqUVMZnwMHex4+E4hrTKWI8kedFz//8cywODxph+I1f44Rj2WYeLPZS5KMpG6
         2VnzC9VYOucAjdko/hJOYcaHN+qFxra2Dj04wYJjWCUpWxn9lrDBcLycuWvtMcP2OrSM
         IV4Go7dZKnhm6wpliQ5PQwitlk8pt4WZ4PBqaSXKtPsgVD0gsbVQ5IlUDTqvHYuISZC4
         xGjfpqCpG+iEKbeHclAjTpWBqxWC9s0xtdXmKp1/rw/WnS8ND2F82Fv0k4j/Ee3UyHu5
         N+2A==
X-Gm-Message-State: APuU4Z+jn8jw8AlQONjVe1ldw/TEFC1aIRGGpYpJAu1ByjsOaHWedfYA
	DDH+MXHBpRS71ADocvWUpYaSFhCXlseY8q5dTQcbiO8GqQ/3nv+jnpr8I0h34J2IkRU=
X-Gm-Gg: AYBFou0+o7gntsVC/DYxpoi/+2Lp33TV0zyZVNn1tcQNCuo05zl33fgyRYvIrYcnv7D
	vYMMrwveycULRNXwmxfM05ke6kTTiOKu6Lz4nZs44U1ZV1EVox51VBdcZnz2vVdeH0iG1SIF/Eu
	zhveUhmqxlNH1gT6uz+R3aTk3KZl0JsywfsG21VjR+0cvihCdsktFwJX9PxDhcxoVt9s9Jxtrrg
	LXHf2LqQpuWBTMsUGYlQXBzxZHEwEkzyfQo38DlO9FsXm7O0MgaQoyjT40cUFxeFrnfDn58POpU
	3wP5p+0DrIO+PBbZxRGXSlS2gJpgQ0mTG9n62EXRXshbWE9Jr1eVFCIFq03SHUeaKCX2bFnw+1n
	Htl8mme8H+osNc2zAX3kZcCeow3u6H9YdRUr0+Le4ZNRj9ne/ALi2tsETMRRjfvBiSsRP0uFnqY
	vg0QRDf0wK8IHLZPXk9p72tpr6rz80tJfWB6m81bypY6lT0GJajQ4/w2AOQv/S7uLm79Wq76e0Y
	t/CcLbudJJvB3zC+7NJdiz0u4hAQcZrmr9lw5QhWpJ2+Ew8fz92KoLlQGbJKAHpDfVBmExq2Ifa
	wgolJWnzcW4VNWLePMNMBIMPaQLtphqelXy1kQ9JVtnCLSHqU4nyNQBp3tQq2/w08UpzL6v+Xon
	nlmO2x9KOyTsXNejCfrz+N6SbsMjSckb5n1EZKL7bLKqgM82Oo5dK/Cr8rXVRuEUv/C8M/SLmnd
	L7Kgdmz0uFnxauOe08je1MusX3V8rlZC0kkdT8MwSZARzivcvNZAL2xLUl29OHw6Y=
X-Received: by 2002:a05:600c:8b24:b0:4a2:1364:252b with SMTP id 5b1f17b1804b1-4ba09383fd2mr113475005e9.35.1794506223952;
        Thu, 12 Nov 2026 09:57:03 -0800 (PST)
Received: from zitrone.tail45b538.ts.net ([2a02:810d:a1:6000:900:be5c:7a9c:c176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb527c755esm31491425e9.4.2026.11.12.09.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 09:57:03 -0800 (PST)
From: Andreas Wendleder <gonsolo@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Johannes Berg <johannes@sipsolutions.net>,
	b43-dev@lists.infradead.org,
	Michael Buesch <m@bues.ch>,
	Alessio Ferri <alessio.ferri@mythread.it>,
	kvalo@kernel.org,
	julian.calaby@gmail.com,
	jpeisach@ubuntu.com,
	rosenp@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFC wireless-next 4/4] wifi: b43: enable the AC-PHY support
Date: Thu, 12 Nov 2026 18:56:56 +0100
Message-ID: <20261112175656.40686-5-gonsolo@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112175656.40686-1-gonsolo@gmail.com>
References: <20261112175656.40686-1-gonsolo@gmail.com>
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

The AC-PHY now brings up a BCM4352/BCM4360 on 2.4 GHz and 5 GHz and
transmits and receives with HT (20 MHz, 2.4 GHz) and VHT (80 MHz, 5 GHz),
the two that were tested. Remove the
dependency on BROKEN and say what is missing: no TX calibration, no TX
power control beyond the hardware loop, no hardware crypto and no power
save.
Signed-off-by: Andreas Wendleder <gonsolo@gmail.com>
---
 drivers/net/wireless/broadcom/b43/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/broadcom/b43/Kconfig b/drivers/net/wireless/broadcom/b43/Kconfig
index 4559549..a8321ca 100644
--- a/drivers/net/wireless/broadcom/b43/Kconfig
+++ b/drivers/net/wireless/broadcom/b43/Kconfig
@@ -149,8 +149,8 @@ config B43_PHY_LCN
 	  Say N, this is BROKEN and crashes driver.
 
 config B43_PHY_AC
-	bool "Support for AC-PHY (802.11ac) devices (BROKEN)"
-	depends on B43 && B43_BCMA && BROKEN
+	bool "Support for AC-PHY (802.11ac) devices (EXPERIMENTAL)"
+	depends on B43 && B43_BCMA
 	help
 	  This PHY type can be found in the following chipsets:
 	  PCI: BCM4352, BCM4360
