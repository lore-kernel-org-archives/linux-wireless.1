Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795845301;
	b=vQZ/RP/tU2mej22MbJnbglAYoLJHENAKGBdK0xBBoRlfJ2YLKX3EoDKyYB4UIoZDTRrK
	 4/V1oxeX/7wpOOMdPBYiNLv4JQ0a0wjc6YwiXZS9wluliFX7CsDEa8Iidi2LDTUB+csVt
	 kXZzBi5A8VMTjhV0vRdhzI0PuIKvpbRBIvMVrn2T5EOfGV+du7sGsm0AtjPBRMrL5cdAh
	 OWXV61712V7qlIoGfgbIB051pL+/X6gB/C537RBU3pPJZAx1mQ7PMN+rG5P36tQyA9+Jb
	 ne71YsfWZuBfpvHcOHFL/TNGxIEFkh+Ee/ptCQwD0G4fB2X6liJTD6kAwnP6Mk1FGnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795845301;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=1EqExbrtxMsw/TI9K+fiwyYzoiBKNpjcgYWFgYIhL4A=;
	b=TMrhqEoFtUBqMJLB4R0oEXk8CGbQCwIJ89uDD5lWVx7rtilQwTva1GeJH3rUvf0WmGsJ
	 JnpCqWWs3ckW++sQMpV11Y6Jqq3B/mc44rfQ2WrVZUe8mkqx3DboVFPWlyiar60bxPSJJ
	 9r/yHBKo5Big//wnmEZYKROd2KGnwbWbUiVOxNERRehdrZE7oyw27bLvoYGlypUrTBpmO
	 AvhJk0ZKk8IPto2ygOMY4qy7IE9a3xxGdMHYcfFd0kuhye6CNQs7xZFtZqEvN4v6Y3vxv
	 Suy6Gml8Rct/AXv8JJqiYwgZG3AOaC/OIFN75Tg9XLxw8UORW1UI2JNC3hdK4uGX1/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jFACcSzY;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD732606A31E
	for <linux-wireless@vger.kernel.org>; Sat, 28 Nov 2026 05:55:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD732606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jFACcSzY
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-385d8a00598so13861815eec.1
        for <linux-wireless@vger.kernel.org>; Fri, 27 Nov 2026 21:55:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795845300; x=1796450100; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1EqExbrtxMsw/TI9K+fiwyYzoiBKNpjcgYWFgYIhL4A=;
        b=jFACcSzYNAoXEP72noN2xPKpfBSEm7l62wVmFgVFxvdmPSJvVT1rv8uv95piW6k5fw
         bBytlYwOJnd4X5hB2/pKpAFc9z7pBdjKpG3O/uwy0uQRmuUZOFzKxOHIDyk9L51TL/7/
         kN8JovSbeNQskTUdExSDenUezHjjujoPyb00tt32PnHT5FmL7W4QKgfDRfFhvpEjy7j7
         3Gqh0xwYf4GZltsis8jyLHOnRaBZTXcXqHak4QSUX0Rk5oRykPqLDqSgMVUvohjLcxv+
         AhAEHsyChOFLMQNf3Gk90+f9CmRQGyt+e9E/kACh9qrBMGmSai0i0WxCNuK1VPb4yF8C
         3/eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795845300; x=1796450100;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1EqExbrtxMsw/TI9K+fiwyYzoiBKNpjcgYWFgYIhL4A=;
        b=mDEdO052wIATauQjItHPIKv1jLjJTrywlDhP4az1QO9ukt0P/E5ween8hWYtLm0MMc
         cvEN02G1n+fui90Ktvk+JK+v2+IZ1fZiYDBtrwEaJMxWqB3z73sfeRxo0q/KExp1RkbC
         AuKm+gi1hpfWAyjPrOxdTv4GR9re54Wd18ar41lmx7Drru77s7mLaibr3gXk0J1pzRh9
         oJAGV3jpjcvokRxmFMRDBfXqsLWfv4AWTPpyJQIcBq6k/NO+HTMlExyvqUg7NNUBtrD3
         MISViSzsmZGog8Js1DnME4oy3itu36q1YRgkZ6SXCBqjQBoSgY+Ax+gZWTIVSbvn76fl
         1FVg==
X-Gm-Message-State: APuU4Z++OV7tMeIJVkgH6XdZ+j0BdQd40fon4FaRFuNCwtAUdGHkTk5V
	Zxf3vd4BzbvZrrrDqNhqq5sLUFZSlNG0vrEYGZLhlOmpxOdqMpgzrS2pulCUEA==
X-Gm-Gg: AZFdTZfo6sQoRP1+98vBqirp0lCpLx/WGjdJnPIWQXtrPd8WtPnpRrGPK+YRk5Xqd09
	6zy+vuXKtHzDAjb+3KSjtyY6gnoJj6xzmMWVqN9tVuulywIGKbUJcIuDMhPb7IsUb7qrDhkxGL2
	LmepQ6LZfZbSNU6fF6gMtAtZPmdGaNwlFOOMsgPgEkndQgLRQSbi1i2csYyGc0+duiQpFehJqjp
	0Ykxu6i84V4iZC7pqpX/Od0k5YMdDf0SYWL/Y6cSDwXpeWZZobfBDr7G39RYRtvwdTRiilXfTWj
	Y/c3ROjpmgzXz4ivW2PKHWbkaafwCdEJc66uS/1dd3eaHfXLPKwQdPn+CW4oB0D79bEpOVO8CaV
	TTDnNwsevqLMUf27eW/Eg7qchl4T+Wm1D58RLr5QDkbFA5eOXQotAEAXKv/Dey79p1fRapwJD5p
	sM2JPONrbA3bGFzYc666fc+jswX97DuuHmJzSjlNawil2DlcdZW/dwzZQEdugi75t/HqFYhiV1B
	wjsYe9OxTCzjARxhcwY/179AZ0p4jd4khZiUti7MnG95/dgSI5w4UaH/45bMBp7O5nJPiuP/v1T
	8hD+PKt7Dr2z8y7I4MrMhvJojkD+Lowf/+tfrx9zzzajvBeVPloilQ==
X-Received: by 2002:a05:701b:280c:b0:1b5:6441:a323 with SMTP id a92af1059eb24-1b56441a60fmr16972045c88.9.1795845299651;
        Fri, 27 Nov 2026 21:54:59 -0800 (PST)
Received: from csl-conti-dell7858.ntu.edu.sg ([155.69.195.57])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b56ef9fd16sm54160301c88.4.2026.11.27.21.54.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 21:54:59 -0800 (PST)
From: Maoyi Xie <maoyixie.tju@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>
Subject: [PATCH rtw-next] wifi: rtw88: usb: reject oversized RX packets
Date: Sat, 28 Nov 2026 13:54:54 +0800
Message-Id: <20261128055454.4121906-1-maoyixie.tju@gmail.com>
X-Mailer: git-send-email 2.34.1
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

rtw_usb_rx_handler() checks pkt_len + pkt_offset of each aggregated RX
packet only against max_skb_len. If a corrupted descriptor claims more
than the bytes left in the URB, skb_put_data() reads up to about 11 KB
past the received data.

Stop the walk when a packet does not fit in the rest of the URB.

Found with a CodeQL-based static analysis tool that we are developing.
Reproduced in a userspace harness under AddressSanitizer. Not tested on
hardware.

Fixes: e9048e2935f7 ("wifi: rtw88: usb: Copy instead of cloning the RX skb")
Cc: stable@vger.kernel.org
Signed-off-by: Maoyi Xie <maoyixie.tju@gmail.com>
---
I used an LLM to help write the harness and this patch.

Commit 83ca360e8528 ("wifi: rtw88: sdio: reject oversized RX packets")
added the same check. The rtw89 USB RX handler also drops such a packet.

 drivers/net/wireless/realtek/rtw88/usb.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/wireless/realtek/rtw88/usb.c b/drivers/net/wireless/realtek/rtw88/usb.c
index 7b1fc7ef10a0..ef2a0686b7cf 100644
--- a/drivers/net/wireless/realtek/rtw88/usb.c
+++ b/drivers/net/wireless/realtek/rtw88/usb.c
@@ -718,6 +718,13 @@ static void rtw_usb_rx_handler(struct work_struct *work)
 				goto skip_packet;
 			}
 
+			if (unlikely(rx_desc + skb_len > rx_skb->data + rx_skb->len)) {
+				rtw_dbg(rtwdev, RTW_DBG_USB,
+					"oversized RX packet: %u, %td bytes left\n",
+					skb_len, rx_skb->data + rx_skb->len - rx_desc);
+				break;
+			}
+
 			skb = alloc_skb(skb_len, GFP_ATOMIC);
 			if (!skb) {
 				rtw_dbg(rtwdev, RTW_DBG_USB,
-- 
2.34.1

