Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795430210;
	b=s24UcdsllmLBCuuVRp8ug2PsSOeuH9wQgz/carEUkxI0tHMXS0nLn34Rks0Ce2QqTb5P
	 BvyhPPwuaOpWjmDyfuGkCqkxr7tiugQhmW8MZE7aZEusmz/pyNIh6fELm1wGu7D3VQ4+x
	 eWTWdXFtajxP5RwRn6pCTt8e/8P26EHK2qLlkeaNANfXJAoovh5FUNeE330iQd6zW0ug0
	 SD/shmdRv17O88z0d+AR2fXeHxaxKDY16QT4SjgQ8WcXEjvY5RA0isrUBsccFqhieaZPe
	 rOQl1rR3DbTL1SuL8SFs+C9D5XT5ZrWTFvhngsnMgyFhcxc4ZW/1zd3347L+xasiP2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795430210;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=H39l3kl3rtVjqoVzOtRozegXJXShbvzgNiZR9xLB/Uo=;
	b=RfKYFMQwhDbmb6zt1DmmdKAfKcsnfdVAr+EqkYhe9jon2ZM60ORSMKXV2SpfVQE/i4q0
	 uo2vOSOe2FKTctsdtqxzC6U1XpaMYKpC7CYaS/MYt4WqkNObLliLUyUYJZRJMop0nQDEX
	 W4XxvP/p8F2pymtlgDuDfr7j0aqIRzOnFyFB00GOuOx+a7+snY0v7X2Gfa3+m4l/Cidfz
	 ydwdRlUaMNy3Hlc1S6sl0I2GN3F1vNpizQcYFMxve0EIcsE0JGcoWy5x8/NttMLWfPRT1
	 MeKokeVHPxkvstcp0oxcmpLdUMnGcSNzyOHsHTuYAncRkSC8F1H5G5hlHLZgfQfW0hQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fJmMj7Qn;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0538A606A31A
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 10:36:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0538A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fJmMj7Qn
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4acb44dcd7bso2501488f8f.0
        for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 02:36:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795430208; x=1796035008; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=H39l3kl3rtVjqoVzOtRozegXJXShbvzgNiZR9xLB/Uo=;
        b=fJmMj7QngpH/a62XVVnqhDI2Scy15rwnOhI1EGKctNfonFhLYZ8kVxOaMOqyTY4Jb9
         hNjCwDnzvWGQ3jPxAWPebvIYTk4Z4oGmOnGl2pYMg5xZ8CeHSkEb2zt5RUvNALULM4/k
         ORLBqERAIa8X5toBNJu4DM6XXx7b7eN8KaM9y2PgWVmwhVDgFStpYvLMdvOLLVuII8ye
         io3nYU+UZaA83CySqRYKSmaPVkZ0TiDn9F8GqRVyS24t9B8hUu/oJcKlP8WnUaE9LoeS
         Dqx0DtJgn5fPPZS1WdRGe21fqIVrrAznp2LFVuuHw1++hkgM5LfH63OS+t0TccFmPr1r
         mSCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795430208; x=1796035008;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H39l3kl3rtVjqoVzOtRozegXJXShbvzgNiZR9xLB/Uo=;
        b=jr6Ab+cPPG93Fd1QJgLGPFkwVPKXjqPuTNGSkVPMVEBf/vGLy0pfxESjwxrhznE0XS
         ieHWHkyEgsnD3vIZuSodELljUSk2Q9IG1LCX84qjSFm02rxEuFK3OWc44r+FoayYznnq
         KbtmJOaJvoz6MUwFoQQywkYW7C8g/ZcMnTIVH0/iVyNirtkmOLMkeQdo7dUSi+WwA3Ps
         psMbrZMkoNA5DrwI52C7rJ8bTVSBV/pNeeKU1FsD+MgymbOFrt9filwaZx/CUp6j4oCS
         xNcfQrXa67QPUzK5U9m6Dwl2V/UaTMMfKm6auMcwVraAwd3zLfwpeezlWJP2HaW084Fu
         iwAg==
X-Gm-Message-State: APuU4Z8SqngcUz1TVit4bbFUmlpINEtW7yTmejZFE6wVSlIpojnYQ61M
	CEFuIAhJneQuUlWxik82cuQYu129ZboH5ziEw8wSj9ziSYJ9RE5pBA2P0y5FLQ==
X-Gm-Gg: AZFdTZe+Pm12sCxw+LbRG8FCuz5Hz8+o+lLAqEs1Q67jwIRrKx84sTZTNXmjf1JgZgQ
	ROmxo6go51qPpR4fmBBMADhfYU9ZVMIGZ44RP+1aSOn7Fa3xf7RjkkrMKL/0x4orPckS8B2OQul
	b0LBnmmi3CpwtHkJBOMQIxoXnb1nsZX0MuRINSHe/SJdfTye7kMYs0NTQwsANFTVlR+NT8GLTi/
	6tHeQBt5WXs6ljF+nnq8HSdN7lTf1Ch4mQOcw5jiZ3vS8ewYc15tbkupMa7Qtml6PdnSUnb/z+r
	kzTlC9YF5kOkEiVx2hpmNh8vb7uUTb1pWg6e937biTZUHyAJ5bSV6FSQSAIlcVJTn6xc4/J4c5d
	NT3XP3G9MMmh4juG9RGhBtzvFgNVdUYbJ9clhVqaJjWiAw6jFVDMID/ROeUfUe7OK4Ar7F818MM
	6dKJoDToicnAI/wrfoPc3jofIJJDH8zpJzprXEDDEiRFZtWK3s2cfdRuC0s3/vZ2RwquF4Y6iXB
	1kLUwMoyzvPeqLL79LmW5Sqm9yF3vLDua85L1sL6KzleBPwWMqBGzUewRy8HyzxIUedyQuJ59mx
	3ZUMlro/wzyXnfxaLNvK4SagtnKuaGEuGPW8+X+c0st9b9TrGjdbSGSHT4X2NMNePagsbJrk8+k
	GG8iN4rSIY+KtiAOCsbMEIcjVXG5h2AewvNPC8S4dNuozXNYt9c/HV4b8YHxf4NSxXcBWdtpEVe
	QtiSvAZ1aQhSFqAJanrURqmV5mKAckU5UrADFZ+tDMCFGlLGOsiA3lhQm+f1MJcc8fsw+9Z4Nw0
	rE=
X-Received: by 2002:a05:6000:26cb:b0:4ac:f59:60de with SMTP id ffacd0b85a97d-4ac0f596109mr23299089f8f.18.1795430208341;
        Mon, 23 Nov 2026 02:36:48 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a00-1028-8388-a84e-20fd-ec9f-e3f8-60d4.ipv6.o2.cz. [2a00:1028:8388:a84e:20fd:ec9f:e3f8:60d4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b9add26sm21664439f8f.44.2026.11.23.02.36.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 02:36:47 -0800 (PST)
From: Josef Schlehofer <pepe.schlehofer@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH rtw-next v2] wifi: rtw89: debug: fix diag_mac crash
Date: Mon, 23 Nov 2026 11:36:47 +0100
Message-ID: <20261123103647.50876-1-pepe.schlehofer@gmail.com>
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

Update prev_sheet and prev_seq only for rules that are processed.

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
v2: drop the p_rewind initializer (Ping-Ke). prev_seq starts at 0, so
the first rule that is not ignored always sets p_rewind.
v1: https://lore.kernel.org/linux-wireless/20261123001225.13076-1-pepe.schlehofer@gmail.com/

The grouping changes only for rtw8852bt_fw.bin, rtw8852c_fw-2.bin and
rtw8922a_fw-4.bin on USB and SDIO. For the RTL8922AU the walk gives 84
sequences before and 86 after, which matches the summary lines seen on
the board. rtw89_mac_diag_iter_all() and its helpers are the same in
rtw-next.

 drivers/net/wireless/realtek/rtw89/debug.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw89/debug.c b/drivers/net/wireless/realtek/rtw89/debug.c
index b129341e71c..a1aa0cf13a1 100644
--- a/drivers/net/wireless/realtek/rtw89/debug.c
+++ b/drivers/net/wireless/realtek/rtw89/debug.c
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

base-commit: 8b29fd95e2d3cb80564eb7cb34248b844422ba1e
-- 
2.54.0 (Apple Git-157)

