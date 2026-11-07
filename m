Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794095923;
	b=Du4S7AJTTLHrmWNQI6iNmNc56A/oISGlSmeZh3uPHXDMPhSNu7ce3HbaBb+roaXhXgHS
	 KXpyhHUsoBuGw7mNi4ICwpFjO680Pbs3K0SkZy5MMnGokRlFODRgqhrtk/voN2BA6gi9c
	 nvZRHGTs8JQofJVfNGFGb1FdF7r5CUq7zsFaUe0GhPK4q/I/FjhxfBYKjvE8QFiSleBVD
	 da2U59rh6GXjC6ftryn84+svpJ/IWrv2TX73MdwrHiC1Wgsw9pEWK5WbAK+AuYpilzdOy
	 B+3XXBgx2t3xtw9HzQaBZf403fbnex2Gbd/QaabGxkltRMbxUGQPbfIZuEl+9uaIiig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794095923;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=eV5BgS6tCJsvmTIiEvJbGeWm/wv+3WLfZCe3gMpFxhQ=;
	b=3NZ8tLxuZ3KtM2CcVN52MBJyOJoMVkZGH439zLwwlWVEfDCAo/rwbqb8ER9IAajCSI2U
	 eZ7wNemqfux+qVDeqfs2BoBATRdDnRryjlUyf2CXvEYBCyLc0pRoeW/wJBCchFeWi1cf3
	 VUkz46g2LnOsZVxUE10aVZ8ywl9aZ09uVBGlE5+b5oIuZJaS8n+Y12DIFUHg2lT0KrqVo
	 S5VJ3ddqfAWwGPdNCSiO5nBanXDRLpYXpu/Le+j3OQSrsXf0UZcDzxTJDs2X+bxOVa3NV
	 OjAzpXYoWauvrH22LMFYyFTw32j0oBy8BIzj8lvRRGnV+iLJXwyDIPp5NXjhbn0lxfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GAIRVXhI;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE98D606A326
	for <linux-wireless@vger.kernel.org>; Sat,  7 Nov 2026 23:58:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE98D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GAIRVXhI
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a2069b9710so568665e9.2
        for <linux-wireless@vger.kernel.org>; Sat, 07 Nov 2026 15:58:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794095921; x=1794700721; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eV5BgS6tCJsvmTIiEvJbGeWm/wv+3WLfZCe3gMpFxhQ=;
        b=GAIRVXhI1tizAJ1IAIN72jT3Xj8fSE9GUObkeN+Uxt/fcLTRlQjNyDyqWm48Eia25Z
         OdDu3Ct6V0507BjqWeacE1wxENwwUXa6T1QNpYvQSHQ6QB2qHUsBJYu4GyOHBXTC72Ns
         eViFvEQYaFgP6hCO8+lPUhmj+XAlQgO4M8zhz/30g0LILwaR8h6mqUyi2ezhdL4uADz8
         y32gvO7Dp7H0Phagw+U0R6I8VkZfklzAEfXN27N/vbl8ddFK8aPIi/+ICJsjonbK03cS
         nQNmdAOSiJkSBKde9hiI5SR1yw5Jm0WqTy+Wj5ax0TupKBvab5YwG2OgodhYIh5O+Oao
         XEXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794095921; x=1794700721;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eV5BgS6tCJsvmTIiEvJbGeWm/wv+3WLfZCe3gMpFxhQ=;
        b=B4WsuGdHHsbcvjJlI8FHuUmoLsWufjgckDp1B6bJcE+w4An3cjN6MlyHLvu7MzVVlB
         nE21boN1/yQz7xkbktzObwojThiIPsacjyV+ZaKCElpE85ZzHEdtVqyUf/ouow7EJNji
         IrBaXfAGszrIQBNHJ8563GwrLmHTd4PWj3p6nooaf23R4v3k0HfZ79Mz9TTqTYgijVa9
         Pk4oZH4vmFGf1crdyhDS0ky6k0zG13oHXWrXFxC0PDzPv9+O/PfMn3v74e7+hXCO/7vg
         7bPsrcbCMLvYn5mQxVWf/sW2i+FhnEpP5UKi3EwSOx9usPMW+V8XcBI29st+viVRHEKy
         YVFA==
X-Gm-Message-State: APuU4Z9KXeqW8ytdwgMykbp3QKeJTZvjn1yK7dBKEaiTYtEexW1TQUqB
	9J6kcFNUND/z6X9sOVavjadpYC1Smoit4/0lvD55Ij9CaLvcHHIEKnssWy5gYLumFHU=
X-Gm-Gg: AYBFou2wlomLb6enwHdaJx3bs5RRHDtCCDiPI4Rjra3ho7kXdaAGw89qlp4m4y1MTkz
	5V7ZhppZ7WmbWk3fzG2qyqax005sGgaTNjleyj/DKI73G3ArfdHokpj5/PhBLQ2+LOLW5xYBetr
	nXqwFL16qy7SWzDRg9oopqiVYUrdrKwpaOh72Tl58iiScUqTWBvUKZKmmZCnhuaxn1uob84+RFY
	5omQFUU9XwcD0sQYfWF5QmazQZY2c8dKlfIQ6ruT/O4s8AfeVAffa5ZBVFTHXsNWak3u+oXbUkO
	PzCbVeNk3BH4GCKyfd6yKFS1zJZr5eWXtHb7AmGXKNNFmnhv0KpCtBS9CmOPHSyRbYULbmYTA4B
	nQy+LyGjshCPuyLEPupCfRAuD5a/Ccg4tbubx3I+6JjVWarwwiRHgFMcYAZnnueUB8r7L7vkYii
	pzf4+xZisWJR+ao0UJv8UbkFdPaJa6kEe9NyVk+R8SYScYaMBl1Beq4wsSCnnRD2iiCvQIUYnvg
	gTwVDxMbn49A3TnyHSKTwAsRwmUqmX7bU5Vblext6Gbj4sQiBHxelGsymB0UogGpu9ESp8ubFtv
	ohZ6LBf6MnKM0mswP9KUvMpA7tvOyYkeGoapRgel/pDNLcIbx7J0QptNuqtR1KpfXrmw+CMa5OE
	axZGuhwlF7zWoiZpIr6mKilg/9cwBVHqd
X-Received: by 2002:a05:600c:6990:b0:4b2:612d:908c with SMTP id 5b1f17b1804b1-4b963ca2648mr3904115e9.34.1794095921042;
        Sat, 07 Nov 2026 15:58:41 -0800 (PST)
Received: from freddies-laptop.wireless.private.cam.ac.uk (nat-184-229.net.cam.ac.uk. [131.111.184.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b90ee1de2esm15769025e9.5.2026.11.07.15.58.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 15:58:40 -0800 (PST)
From: Frederick Watkins <freddiewatkins6@gmail.com>
To: pkshih@realtek.com
Cc: linux-wireless@vger.kernel.org,
	Frederick Watkins <freddiewatkins6@gmail.com>
Subject: [PATCH] wifi: rtw89: pci: disable D3cold on Lenovo Ideapad LNVNB161216
Date: Sat,  7 Nov 2026 23:58:19 +0000
Message-ID: <20261107235819.19758-1-freddiewatkins6@gmail.com>
X-Mailer: git-send-email 2.56.0
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

The Lenovo Ideapad LNVNB161216 is affected by the same PCIe link loss as
ASUS ExpertBook models after entering the L2 low power state associated
with D3cold.

Add the affected board number to the quirk table preventing entry into
D3cold.

Closes: https://lore.kernel.org/linux-wireless/auyIxMg3r767ud7z@freddies-laptop/
Signed-off-by: Frederick Watkins <freddiewatkins6@gmail.com>
---
 drivers/net/wireless/realtek/rtw89/pci.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/wireless/realtek/rtw89/pci.c b/drivers/net/wireless/realtek/rtw89/pci.c
index ddb27c7782a9..064f5bd7ecd1 100644
--- a/drivers/net/wireless/realtek/rtw89/pci.c
+++ b/drivers/net/wireless/realtek/rtw89/pci.c
@@ -4797,6 +4797,13 @@ static void rtw89_pci_d3cold_quirks(struct rtw89_dev *rtwdev, struct pci_dev *pd
 				DMI_MATCH(DMI_BOARD_NAME, "P3606CMA"),
 			},
 		},
+		{
+			.ident = "LENOVO IDEAPAD LNVNB161216",
+			.matches = {
+				DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+				DMI_MATCH(DMI_BOARD_NAME, "LNVNB161216"),
+			},
+		},
 		{},
 	};
 	const struct dmi_system_id *match;
-- 
2.56.0

