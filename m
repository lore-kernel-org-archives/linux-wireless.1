Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795392750;
	b=DlGKUbFKPkSWXwmf8fFhXsFBSRonbHtPmTej4Ed+I6xXChLf2GRPpdjE03zcrs7j44Nb
	 pkLcsc6E2jBeHQ7mswvNJPMOz+diH34gwQtlNeVOzcNZ29SBIBtfJO8uWxXaiFjZhNXFE
	 qOIsarmISG0v9jW2JxW07JdxrENXuVa6EsI9m2Cj7YMHxSicCI95bEQCfW6yn5RmgT4vp
	 I9gawV+/fXrlX0r8QUQn0BODu/+f3WQtoSp6W/gTrXdnqbGkHA2lwy6jlOpkvQUI7UoLA
	 5VsFt+ab68U3iYwD4yA/vBfd/mwVsLYtuaPkOspUZD0s07l1SCXy8GyimhyhJ2L+EuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795392750;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=lhlt0KzskqnEnd1Ey3yfWlTFhnxlBDfrSA7gGjMH8OY=;
	b=M9eq3uwlEq0Y6tJ5Qv5VtFUANkJ0vr6CP8pRpIq1E4+PkHAr19hSzrpPr0Aa6T72Zbz7
	 RoFG1o4gihyiI9h9n0txhyypE9Vv+9Ky6Ib2MaguXVLuE51Ee+kQf6sz+vn9zEfdyYSb3
	 /A3x3Yn+gABAfewdqOceEI1DHw2/0pCC+hBCYHax5UEXmlIdv1f2wJTQ4+KcW2zJX7r7X
	 1vWegz6+VpdWQxTIwu5c26U7Zj6n6t8Yazwz4kRXapXCI+XEO90XqSA75WFtfx/ojB40a
	 GTmNt6O2tavmX5Y5M5zZrGAJHfyG1RotDq/WOOmlB2EeiLk8jJkmb9Ovbouwn8tGb9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L1UO7ujP;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F4E0606A31A
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 00:12:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F4E0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L1UO7ujP
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-49412eb1474so1650149f8f.3
        for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 16:12:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795392748; x=1795997548; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lhlt0KzskqnEnd1Ey3yfWlTFhnxlBDfrSA7gGjMH8OY=;
        b=L1UO7ujPmKZv8yJI1CO++OVUaZtLs5LjDA2g9i6PjpCc/5HRIqmZ/ZOKlnpyfyKSow
         bhKlUCw1JG+eZfPJaHpjtG1jrdNt96rxL8gRXJaLrmNIZt0p+gsnzHBoIT8lovcSkGMk
         OQvdGM/g9gMaQAagiSMiSQ2To8O3qabn30ckL0cZeMbsvufb/Ftpt12yYXhn9ldhXFly
         dhzleor+J0OR5b4kidX6HAdRWKIfc6ISuogKIAY1Y8iPWzHtUVXOYbdkr2kogh657/pQ
         YfjX6b/wcpWlN3PT9lwyA8x996nbaBQo+ZF+O3k7kNpllb70n338DpNeLTpGmqPKJR3V
         R3jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795392748; x=1795997548;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lhlt0KzskqnEnd1Ey3yfWlTFhnxlBDfrSA7gGjMH8OY=;
        b=0VhMGNh2g37mmeXjlzhNk4yzkYdA8PrquRgETKZ0H5bW/z6O0hlX4qsFjXW8CyJkJB
         nmULJIzUUlK8vODCXcHiMDHHehn56QFyFtRpGMT+xUQJJ8sCCWwknnLxmapwEQn++Qy+
         9Q9/RTuwIvoCswoAr5D5M9kQfhhWVSCyGg9lIcn9z1d2lBFrg9H74elWqdIkD3t1zRrb
         H/noHQOm6n6U65DW3eCMnPfFu19SKurFvj517voXNh3Ja6fKa03DqsNTGMdf7U6n+zHz
         jI3zCbP1FqubxkS1lgE9MCQ87U0Dib9GnQ/TzGxTmVrPnmEPr9DICue1gEzIicoALHN/
         M9dQ==
X-Gm-Message-State: APuU4Z9Ps0jKlyhEegFaCw1D7DTGPhgxH2L9ISUsvdjk5ViPdahtFfwt
	42UjFUkOASYdccXs8bM5+UW3lTf4ZZDs6B9pT+hVx+jXOYbUa+XTzcuXtjkYOg==
X-Gm-Gg: AZFdTZdAX3fgnk+J6RLFrQGhCZoXpETPVI82EKHDehtj49y7t6vNOCbjlmYO3mckvzD
	qqM0H8OdQOtyyaAbD4ndwRIeCIayaeNRzNWKKZy/MD6/vEFokn3Uemj1ml1Ub4GbFEScX0pF4Pr
	YKjpmztG4xnnnnPEPihnZSLm/U6Jroww1FNhHRkP/hmT7/nXpqLH/XNprUcGJe6AIM+77oaqa8T
	1NUKxYLxETLHbXf0xEsz6r1Ct6kb4uAW6qXhttF7E3glS43brgzUU/6/5QmCFOc3fQwyhNN87Np
	B0f4wqiUERjI85gaBkxAVmKsuE7gtl8eBDT7Bh6jWrIhQSyws8cDhoLWWMJiGWO1oKlu15HBJu2
	auQY25yP7S2ojS37AsyCDFcpydNWCdzY9+/vY3S7m/fNfgG7sansBi1h7Bqbqrxa5SjA/JIMoTP
	AI3YtJeqTmrnC0jUiPk7Oma1qfd10tQe3sLq8xFv5g08X+0ol61q7xEI0vPUeS9zaf+/5IyXH+v
	DBRfkaYQ0bH8wkJ95N0UuoKiHs2xg7xXQPOotkkmG/1aiOrdVLL1A0YqHyh8UYF0h2HlHVdC8OD
	wxGv2JQqCgd2mvJO3zhqlzqIj1o88h+2PnAbtOcBsBeSN1YfWoit9ak/F42A0sxaVRjSd7cG1I7
	uORtplobKQc7VaUjjSIBTz5XIpRNRFwnSiSiRyq2P/Z4GIPyNqqr4u12a0WcQLqwE94komhJ14m
	xNbXgAmaXCxIwXRrai28HUKZjsfLm5fxJ5+HmxZzy7UlJlgrZnLaiufQ==
X-Received: by 2002:a05:6000:2310:b0:4a2:ee0f:4fa3 with SMTP id ffacd0b85a97d-4abad6a4224mr22263002f8f.8.1795392748376;
        Sun, 22 Nov 2026 16:12:28 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a00-1028-8388-a84e-20fd-ec9f-e3f8-60d4.ipv6.o2.cz. [2a00:1028:8388:a84e:20fd:ec9f:e3f8:60d4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67f1b2sm17597886f8f.25.2026.11.22.16.12.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 22 Nov 2026 16:12:27 -0800 (PST)
From: Josef Schlehofer <pepe.schlehofer@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH rtw-next] wifi: rtw89: debug: fix diag_mac crash
Date: Mon, 23 Nov 2026 01:12:25 +0100
Message-ID: <20261123001225.13076-1-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
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

Some DIAG_MAC elements start with rules for other HCI types.
rtw89_mac_diag_iter_all() skips those rules but still updates
prev_sheet and prev_seq. The first rule matching the device can
therefore be mistaken for a continuation of the same sequence,
leaving p_rewind uninitialized. A later sequence transition then
rewinds the output pointer to an invalid address and can crash the
kernel.

Update prev_sheet and prev_seq only for rules that are processed,
and initialize p_rewind.

A walk over the DIAG_MAC rules in linux-firmware 20261019 showed
unchanged sequence grouping on PCIe and corrected grouping on USB/SDIO.

Tested on RTL8922AU (Cudy BE6500) over USB in AP mode with
backports 7.2 on Linux 6.18.64 (OpenWrt). Without the fix, the first
read crashed the kernel. With it, three reads returned 147(41)/86/84
and traffic kept working.

Fixes: 7bf433c6767f ("wifi: rtw89: debug: add parser to diagnose along DIAG_MAC fw element")
Cc: stable@vger.kernel.org
Signed-off-by: Josef Schlehofer <pepe.schlehofer@gmail.com>
---
The grouping changes only for rtw8852bt_fw.bin, rtw8852c_fw-2.bin and
rtw8922a_fw-4.bin on USB and SDIO. For the RTL8922AU the walk gives 84
sequences before and 86 after, which matches the summary lines seen on
the board. rtw89_mac_diag_iter_all() and its helpers are the same in
rtw-next.

 drivers/net/wireless/realtek/rtw89/debug.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw89/debug.c b/drivers/net/wireless/realtek/rtw89/debug.c
index b129341e71c..8dc3464832f 100644
--- a/drivers/net/wireless/realtek/rtw89/debug.c
+++ b/drivers/net/wireless/realtek/rtw89/debug.c
@@ -5257,7 +5257,7 @@ static ssize_t rtw89_mac_diag_iter_all(struct rtw89_dev *rtwdev,
 {
 	const struct rtw89_fw_element_hdr *elm = rtwdev->fw.elm_info.diag_mac;
 	u32 n_plains = 0, n_rules = 0, n_positive = 0, n_ignore = 0;
-	char *p = buf, *end = buf + bufsz, *p_rewind;
+	char *p = buf, *end = buf + bufsz, *p_rewind = NULL;
 	const void *rule, *rule_end;
 	u32 elm_size, rule_size;
 	const void *msg_start;
@@ -5325,11 +5325,11 @@ static ssize_t rtw89_mac_diag_iter_all(struct rtw89_dev *rtwdev,
 			break;
 		}
 
+		prev_seq = seq;
+		prev_sheet = sheet;
 next:
 		n_plains++;
 		rule += rh->len * 4;
-		prev_seq = seq;
-		prev_sheet = sheet;
 	}
 
 	if (positive_bmp) {
-- 
2.54.0 (Apple Git-157)

