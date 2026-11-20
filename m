Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795215593;
	b=ZBAVZc8udF66Snb9/ITAiU0mnAFVZCyjxjzNgqy6Ui3d2ODZDEyXf8+P8vWu7VbV/7iO
	 pIylPdKwKbP7kD1GZf6yC3/eIi9efYgcpqGdQL3OISnzcC50c0zrj1qXI+cbLFT5BGa7H
	 1r3oqu3mXdaa2Py0LU0t67hB0XrFIo78UGVgjy9TdysVlgk5/Dc6CF4WLUMoZhM6ib6UB
	 d7QTQUNQOZYyozt0e2Dtdxgv22J7DcBJOlIPFMYIjcKTAoNuDui/19PfI6xbGhkk70tkD
	 ojd6LPlSnx0cWH2YNdowHWNX/0YddR/aGNdPfCkLVFypNWDmMz06HrN/DSNzocf2VGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795215593;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=YPDsvFkr4i8FkAzmO1aMvRKcZ2VOzq57ruv3ddaJg+E=;
	b=muwz7IosaAXEpeO8FrcR565l1zLskAr8YdUEyYQ6v9kdoyj/IkkRngLrpMea0eI2ASBW
	 lD/Q25s1CjqIH5LhS5Mpi0p3cx3XwJ4JPTi8IoyC7HClw57sPSQH0nC3ZvWKNW6RG2Fxc
	 zd6bFeQacaj9O122jg7cyUpiSXhaXZFu3rddRMtG36vS6I/nCQjSYJF8VgTW0mIV3bXaL
	 io0iqQ+fOBAdzcyIXjCpQC7VpCRCVFcYtXfVWQnOwRkxm8nEJ81Dr5B0M4ZhJ1WWImv/6
	 fIU6zohds39JxCxWoH2Fk/hQoAqzzolNroDqS4LAkcguzAkOuNEB4OoPb/fhZ2cQtfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Q/CunrUC";
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A76B606A69B
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 22:59:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A76B606A69B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q/CunrUC
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb606491faso8117485e9.3
        for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 14:59:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795215583; x=1795820383; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YPDsvFkr4i8FkAzmO1aMvRKcZ2VOzq57ruv3ddaJg+E=;
        b=Q/CunrUCCCYy0T/k7VAhBD+gvhvoI6xzmbTMZXnbbhVp5ChLwSQfU2l7Wz0KBndhln
         dWXqyuwyBILR2yxInR0MFYB/i7IwSYkVJBiAKVcJhRmUJ+Sqj3AIxWLjsfw0QiZolztd
         +Jeu7N0slmqGNw0/xosPOIqYKKloP9tzBRmidT9jJoKtUvJYcaWKHM8vavk599QYsGjO
         fj/GbtPfq4Dg8FefkuAuM1vu0MPE5amntWtjqWcLWto8vqmnVaRn19zpLfuF8m4uQqgt
         7SagGCceJ7UTZvlhsfxATzJrSzgfltOtUM4yT8Mtd11p110Hneho5GPUP3RK3m5WMDYk
         r0Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795215583; x=1795820383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YPDsvFkr4i8FkAzmO1aMvRKcZ2VOzq57ruv3ddaJg+E=;
        b=NfaEvX6HoXYhkd5mzOpDDUxrovOonWJhlosLOHfEI7gavcFHLKjlqQQwITaG14dyOp
         8bioQ/y9FqsjCqQroLZxoFjSPJSV84POzlWcUTFuO4RD6cEWe1mXW0pc3kLi25zwI2Gg
         RjtJAJ9CCYGJTzFkYbb+x3L7gWDPGFssJzKnjKyzoEtBYl7WKSMTYO5sTzVDbze564at
         FN/3rTopAvHGcvMRzvkLHXbo4ZljiqOHjhzu+048Dy2Wd6MrQ1Izl/PzNaZxLXKwQFIu
         bqcF/tdWpF/Jpo6T9Y+M2eS7OwK8+zATOBrpovbgLj9SjhB1sNafjFmk/hF1KySl4B4z
         AZ4g==
X-Forwarded-Encrypted: i=1; AL+hErFMh9+3CGf4yTiKK5/7MSJtjOQexs3kJtzr+vNN1o8uVvxg5CmQhbDnluecqlxoeAx19Vjh4sjES2b1rtPuMQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/nNjesFa7cdgoX9JGhtF91S93aIuXK0igVWnxLexKkQdkYL3Rj
	ulYymHYbmV8FafZaV0Wb24SxX3J9JbslsvyJW5CKPwwwds93ILGWPtY=
X-Gm-Gg: AYBFou3UaKM65ll65P41tNp8W3vPvgzKH0H9dEvQg1UQwvMLfAFeHAU/zfnYISoGqu8
	K2othHeBU6P60zA7hkb4xrf2RvNFc2N4wI5ZRmuUk2cmY2DOvkEC6+WtoPozhhvqvd8688iyoJW
	7hOsYAgLzpCerQ0wBQOMvxdLlql1mTGA85EXtx9NwYtmJsyRksRf29lq/bEs3QEvI/vcF3YW6Z1
	R7dLhzqcnR5cSCT0VwpBZF0lCVtHgTrfxS4Hm59Vv6YdeD99iPeYZyjMr4fz5Qs6KOAZRYFi2/W
	lS/viDH/w4PsP+c5YhHvdV3RJb91hByL7pW9DX8hqA/cMB6G7Lqg2Agw91+4sFBtDamAw/90rSu
	IPPEPDGzJ/ueXHE6PMIj5JCl81f3un6Sxt6NEml1N5mBsju/oMkvmMCW4jNYs6intOCtvmKbkqn
	VDCTUJZ0gii2/n0mjmI6/vgXW5z8R7HSY8PtS2+d7zzQCaxOTE9jsTv14K8ee6OjfdOA8zLHQvB
	k6M2P6pKkhHycwLwLaIlz2K7m6//VwkTbRiMMSR4uuFCrc3gaxrp08H1VUQ9ShbPjveU94LhzHQ
	Q3VBzoQ48p0Xf8BRGAVuBb1RR1KH
X-Received: by 2002:a05:600c:37c6:b0:4bb:7033:c938 with SMTP id 5b1f17b1804b1-4bb888147b7mr102309785e9.14.1795215583026;
        Fri, 20 Nov 2026 14:59:43 -0800 (PST)
Received: from localhost.localdomain ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88442995sm128863475e9.2.2026.11.20.14.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 14:59:42 -0800 (PST)
From: Tristan Madani <tristmd@gmail.com>
X-Google-Original-From: Tristan Madani <tristan@talencesecurity.com>
To: Jeff Chen <jeff.chen_1@nxp.com>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH v2 wireless 1/2] wifi: nxpwifi: validate ext_scan buf_size against event buffer length
Date: Fri, 20 Nov 2026 22:59:32 +0000
Message-ID: <20261120225933.1148680-2-tristan@talencesecurity.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261120225933.1148680-1-tristan@talencesecurity.com>
References: <20261120225933.1148680-1-tristan@talencesecurity.com>
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

nxpwifi_handle_event_ext_scan_report() uses the firmware-provided
buf_size to determine how much scan response data to parse, but never
checks it against the actual event buffer length. A firmware response
with an inflated buf_size causes reads past the event buffer.

Add a check that the declared buf_size plus the event header does not
exceed the event skb length before parsing scan results.

Fixes: 73b01e57ed3e ("wifi: nxp: add nxpwifi driver for IW61x")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 drivers/net/wireless/nxp/nxpwifi/scan.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/net/wireless/nxp/nxpwifi/scan.c b/drivers/net/wireless/nxp/nxpwifi/scan.c
index 4eeba6700aa72..398c3f8ec0781 100644
--- a/drivers/net/wireless/nxp/nxpwifi/scan.c
+++ b/drivers/net/wireless/nxp/nxpwifi/scan.c
@@ -2443,6 +2443,15 @@ int nxpwifi_handle_event_ext_scan_report(struct nxpwifi_private *priv,
 	u8 *scan_resp = buf + sizeof(struct nxpwifi_event_scan_result);
 	u16 scan_resp_size = le16_to_cpu(event_scan->buf_size);
 
+	if (sizeof(struct nxpwifi_event_scan_result) + scan_resp_size >
+	    adapter->event_skb->len) {
+		nxpwifi_dbg(adapter, ERROR,
+			    "EXT_SCAN: buf_size %u exceeds event length %u\n",
+			    scan_resp_size, adapter->event_skb->len);
+		ret = -EINVAL;
+		goto check_next_scan;
+	}
+
 	if (num_of_set > NXPWIFI_MAX_AP) {
 		nxpwifi_dbg(adapter, ERROR,
 			    "EXT_SCAN: Invalid number of AP returned (%d)!!\n",
-- 
2.47.3

