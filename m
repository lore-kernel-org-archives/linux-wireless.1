Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795542392;
	b=r+wPWTJTgU/BDNNbytsVfWGwySqZM2qGaiY/cmS16NIUV1dloa1mYoSpKbGv9muehvPp
	 FgplSemReETQWYDnGF72+RGBGPNZ+NTw7dOnjk2MOwuDBtg3ueo7irIrgycEEvhh/BJG2
	 fU5fVYJp1F372blXfYC/k6S3cLbyI5lPEIQ/mqr/J1BFFyaXv0/rGMM9uplWxSfFooKdy
	 COf9rDlETZ8ssvYKZupLZyK7qipq3M+39tZXdsvnR659G6X2xT2G8UTjuQsz1R0SVao6T
	 Y8YkG+vGJfcBYTVJ8bE6i6gh4LkGzlgqbYL27v2oM8iUoFNlqafTeuuf9FS1kv4lIIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795542392;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=eJ45RhdWQYaNGviQo8DZFSlW6V3bfg/JFh/lL6cjCXc=;
	b=h+2PMQafiT9gYtFMwxUpCCz1OfW3eBpe0lPNBN3roM3ZUhsnG+YpkzXYwicBfegt5hzk
	 y3oPwB5AG/glcW881D21wy7Ce25DOnv05na0TtOYG5sLd2zGr8xDx8mbt8e7wwWlTxIJV
	 9Vv0m8loXi6fSA8xGnvlnfOefx19ktwWCAnTmDkoZqwLS6CCXws5CpAau7bp5Kv0ghDfZ
	 S6gpI0dUi8Z/d/wesg6ktf8sCEPrQ72yTdiIyINOQ6eVrzPW98bAo4FXGqOCRhWAGqIeH
	 lrfYxB7tAKlfeVuomNgX02acRV9xQWb0IXMuJwDDZrlJII8V7x2/m9g+PM+xjVVnlgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bphLsgMU;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEFD2606A327
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 17:46:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EEFD2606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bphLsgMU
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4bb702a7548so41494865e9.1
        for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 09:46:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795542390; x=1796147190; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eJ45RhdWQYaNGviQo8DZFSlW6V3bfg/JFh/lL6cjCXc=;
        b=bphLsgMUcTwPkjB8anUJ99p+2VGCLqKqRkqXlsXy+lJpPFTBWwtNrZbN43+4vIEd7h
         lJCzArjzpNkZnTQqhPei8hZCob7DexbkSPZcoDrOKH67Laytffz+gAsY0a9pzy4gzQLp
         U0sHfaCRzSKgqWYjQf171AVeHpCbJZyXUXNHUHHZ5mb1HuvpPpwpVYiyk4qlI8g+NxGi
         QixorEntJmNC7QJbhyET2CSBtHhaOXJlc/57xXCULfx+fxzpdyFJZelq4GjemFr6zju8
         WPqdLtY/7DxoMutiY62Cs4EH6kDNXxxDpBr3cMvKs5Nk0LNSW2fi2cHELw2/jVukN49O
         4//Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795542390; x=1796147190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eJ45RhdWQYaNGviQo8DZFSlW6V3bfg/JFh/lL6cjCXc=;
        b=T24jaYgh+hNZbdD1+mzxgI6Jke8GsYZ1mN03nwcOeTVh9m4IZX8uJjtdhtt/f9R+lE
         mfTcOEoqc2QkkWE4y8DkyGzz3/baJbpmnfHfqFbs2DXcGZjbSoY4Rp5i9x1HtY7UC8Rj
         SMwDL4Wca4t8ldNBxDLaKJHFkfhi6KPoJDCVVkxrDjfPsZcb9P+rlwBWxhurmCHmlWs7
         TKOsrDpiw/2fhikUCxtIImrLR+Q/WuIpNeutN6EJRYKMqWOriiJJSTxPSyx37B+/dh8V
         KosR7QgBWqITymHl7BgccnifgDeb4rX7cd3hI9354l/mq3iHDhbozVScAtz21S+67Xf/
         1kiQ==
X-Forwarded-Encrypted: i=1; AL+hErE2asPVwF73p5dFIkILFLZmuHaBRm+mPGTm+dyj95A43w8J3TIHXFa6z4JZgXqqKsPx1lOhqUDRTNhNjWHNSg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8ZClQ8lEoof8pd6gSr/1UFWseJRMtXtgNEQkIcPrSY7Agh2851
	CuKRIx/E4TQeMUfuYw65f9Yxb/T9dpLQnuXBZPUmdYlojAWbRJ3RfD0=
X-Gm-Gg: AZFdTZcVTyvK0kuI5J5E2QJcrkSkvZkb54lS/LS3HK5mfRDAihQW+NeylqtTYLXLaRi
	uQWO3WeO9tH7AkSmnBxsZep5J5Y3yGYiMhUo9w4b/7t5NW3AE5HwHsTUi3Qr8LT256ahADcHtC9
	W09JwvoU6wrvqLKiz0zxKEOnvtYYludY4B3xQLtRXpTMJOQrAR+iY+u1FYTKkrvFYPzJAfUXJL0
	ejmv9KZ7YugznWkEYQtrs9Cd950Wu1kshde7gQip+V6M72c99CCJke2ETCMW+kfjCQp+NgSZygE
	1f5Rcs3iyTTw3RZmN+Gr6zmy0HkYXSo+S7LMgukdkjehbp2U/dqHMrkx3fytmEYtLjrX1dgj7mW
	OjOFafdNYxByFKYtE/8ptr55PhfpX8DiSY2AQ5Ihr+Qmd9ecvO0eI5RSTCM7OnSL56cZdcsSPI+
	ttk5TyAh2xmQo9zn/DE9VIfAEDKH/HSxAC4tSPLenpH8W3dd/MPyywRw2njM3B5ToI5G20xdcGe
	jJ0fV0wMxm8Nvnkp/QxbV0UYIiCdb9LgrFydeCUwn/GDU0a0vMOPQ2uI8/ZuRTAYoJ/ZJvA4I4o
	IyQRr3hziXWrVhU=
X-Received: by 2002:a05:600c:3b8a:b0:4ba:761:c0c5 with SMTP id 5b1f17b1804b1-4bb8880f0e0mr316226585e9.5.1795542390429;
        Tue, 24 Nov 2026 09:46:30 -0800 (PST)
Received: from localhost.localdomain ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b39b6sm413261165e9.12.2026.11.24.09.46.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:46:30 -0800 (PST)
From: Tristan Madani <tristmd@gmail.com>
To: Brian Norris <briannorris@chromium.org>,
	Francesco Dolcini <francesco@dolcini.it>
Cc: Jeff Chen <jeff.chen_1@nxp.com>,
	linux-wireless@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH v2 wireless 3/3] wifi: mwifiex: cap TLV length in IBSS connected event handler
Date: Tue, 24 Nov 2026 17:46:20 +0000
Message-ID: <20261124174620.1572200-4-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261124174620.1572200-1-tristmd@gmail.com>
References: <20261124174620.1572200-1-tristmd@gmail.com>
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

From: Tristan Madani <tristan@talencesecurity.com>

In the IBSS connected event handler, the buffer-bounded evt_len is
replaced with the TLV header length from the firmware. An inflated
value drives the IE parsing loop past the event buffer.

After the fixed-size header advance, check that curr has not overshot
the event data before computing the remaining length -- the
subtraction wraps when curr is past the end because event->len is
unsigned. Then cap the TLV-derived length at the remaining data size.

Fixes: 432da7d243da ("mwifiex: add HT aggregation support for adhoc mode")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 drivers/net/wireless/marvell/mwifiex/sta_event.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/marvell/mwifiex/sta_event.c b/drivers/net/wireless/marvell/mwifiex/sta_event.c
index 1f746e8f6b3e1..98f33ec186e63 100644
--- a/drivers/net/wireless/marvell/mwifiex/sta_event.c
+++ b/drivers/net/wireless/marvell/mwifiex/sta_event.c
@@ -45,6 +45,10 @@ static int mwifiex_check_ibss_peer_capabilities(struct mwifiex_private *priv,
 		 */
 		evt_len = le16_to_cpu(tlv_mgmt_frame->header.len);
 		curr += (sizeof(*tlv_mgmt_frame) + 12);
+		if (curr > event->data + event->len)
+			return 0;
+		if (evt_len > event->len - (curr - event->data))
+			evt_len = event->len - (curr - event->data);
 	} else {
 		mwifiex_dbg(priv->adapter, MSG,
 			    "management frame tlv not found!\n");
-- 
2.47.3

