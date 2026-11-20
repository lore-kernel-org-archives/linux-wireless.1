Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795174300;
	b=KVGnGvit+8+kYU7N2aZLRMrtx2DfKIFFWP84UB13raCLHOFyfMzyBv6yXXfNeNDJh+Oi
	 ILPzRy0CKvt/yuoE9BPNp2QJqna7wa1Pvziym5Ic3Uz3jZBY27QKMYsyU1rbUaqHK+0N2
	 xK2A9S6NqUqe6r1IJYs/opf9ZieKINR5itwDe2zykVmrSMGMEwg6Nw0kRkDDCEurAyteJ
	 7TvyMzfnDPjaBZVyqU8CNX7uLaNBpNhcFpRV1JlMfE9hAQR3FflQBjf7pAjWwyHixKYoA
	 3wOCHO5kTfHzDOkBXe69jz3O6VMXv1iuO7Ls4ZZQTMwEyjKVLqJMnsSzXqKnMCWe1pQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795174300;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=677whf195NLsgFLCzjEzru0i4Z+4+NkynuJcgslET6o=;
	b=2KuQH87yf6pPEvrDHraP6XByd7lBQxqGkbThFyKJY5iSTe7Vd13ZaUALDZlisksmnz5v
	 ilti0fNZPgiTMqW/nnnSpOlLOlqVbQPqmYtJNWcuWXgaD0EZP7qZX16s0NkdXC8a0rlg6
	 hqOmbqN+d1Y8OZPELlZuYhuLznW7DY4GMOhR+2w9CcRJuRHv2zXMmU7vLL9WpaC2Khkvp
	 41SXxGwK5nwLN0p86oNMa95ZBBljsl6KSnahUzZbBMjYEwEJavV5MIJxlY8PP09TgUs3i
	 udTHNpWSKeMcMNurEC7h06JOiGtruTsk5I27tYG1NCH3sq3ue8+xAZI/mNonZfoTqfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BNoWSv+u;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C78C60A3815
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 11:31:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C78C60A3815
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BNoWSv+u
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-380b40319bdso983124eec.1
        for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 03:31:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795174299; x=1795779099; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=677whf195NLsgFLCzjEzru0i4Z+4+NkynuJcgslET6o=;
        b=BNoWSv+uGI1UPoC2rwjghY63rtirDaiZPwabATfulMbPmoyFylEC+Y4hEBnJc2AO4O
         dIXomubMCgsdYj5RkqcNMAUJII9Jiwo57bsCCNHAGfedPkoPCvRNtutvm8qoR7TY/JDT
         h5RNpf+Xb/i97qkWVgXNBSJ38ArJ7qWXGV4nuvsW32LKEwNeTfOxS90Qa7bMuklKTaHp
         o5ysHa44+++y7CoiEE8ikhDBPFjMuaxZ4sgeY7vJBayw5fFPKVqT6a1fnJ+H+VQeXuNB
         s4ePHoNEIpyTApsX3KHiXljddXwyeiA0UZocKOMnMvuSmfx0iT1DdWUxOkrXG6hcPs/Z
         TWvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795174299; x=1795779099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=677whf195NLsgFLCzjEzru0i4Z+4+NkynuJcgslET6o=;
        b=OmrtecS91KcMZSVHPTmq79jmX0zE+l+aoUl79kR2P67OnZmSgIGuy03mCR9gZPyc2U
         cyP2EtbJfjX+5QxdsELM3mzXrll5Mv952dR5MYmtMd4MSnAkI3tR256duC3cspJWP+pl
         uzt1tY2/2SAsJ+LI/Vv/sE3MTnbNxlUfIItDAP6VWasjeVpRO0GNy5a90t+8AoErJzIF
         NXt6nyNxCkQYYow7XZ0qA7tjPHSG194doPmpmd04Wda9RzWIFtgR6xnkgK65vQSZgqnR
         nIdatKDC4W0NBGYsmTORag9OUEqLLkCmb12A4Blvm37wrpZCikUoVXFbHsgF19MaGxoi
         HlgA==
X-Forwarded-Encrypted: i=1; AL+hErEPpKdX/Gcv3qH/8WyIYJ8yyxarkURLh0WEfHvOAHjF3YktLODL80oeG2IkTxTFqoN3Boc2U63XBmbqgYVVdA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/JxpFZc7KX775Pm87Kg92YnnTFq4zhAVLMhds9mcZdF8h1bfwv
	y0XaMCSYdyhBV5VtafZHZe0YvolFiZsPaznM6bJcwwEAGxZy0gk3GceX
X-Gm-Gg: AZFdTZeS+3LWledR8o/o6avJS5mH0PUHBOtXniCVm9h+gr4/Nh9BUhVE/zBDtp+MfW2
	Lr6qDkB2P7Dh1JNtjydYB2aeXvwCaErx4ZzS7g+mS8EGiN1tVxY0FD0ZfbyfQC68dbM7pSsqB3X
	DFN5IHntlB6Pk2/a9ZoaG4GyQgpGHOUzReG0B0rEGV8T9YSzgqd//0+QgiFp7AMjYH5oB9Fi/Bc
	MD377GGaa2zwQ2YoFLXHhSSOrS4ULvEHlVTseVrGctTiwnZSHIHEzQODodVJc3V1VwlSg+7E+Fa
	nzp0jcpjYyfiTIm/GGhedH8QEZAA1IDBRihCad+2nMjlJKUJuzLBt5ZIykp2B2dEbBo2Vq7/kjl
	1MG4CD1WLvy+Bo2ZuAaAbSeXW9N7dTFDqwznzleBi9Kb/30AFAqs8KUXh1hedLtgz2X4GlsUnQY
	jZ41cdZx8ncOdtUYW9bghFMVFLpRlKrHkjw3NeOx0ueogS6nU0X4xgZrCDcD/14TdQtty8LAJLU
	U6AjCljSlfpG8DibDr1XYQYNw8oDYf3t625WaZJS4jBfNgaLgJTSwvg1OjdJwP9BMmOIhadeDT6
	Nw9JYaO7S46rRYKoU7Xk4ykUWschEeQheZoAFk65OFuQMwU9sXbMe6HanXyUTD5G9q08QWMC+R4
	FtONZiLkeXL8JCl80u3QPdREDpvCR6nD1DEuTqTozn5gg
X-Received: by 2002:a05:693c:829b:20b0:376:552d:402d with SMTP id 5a478bee46e88-38570f29044mr3045263eec.34.1795174298523;
        Fri, 20 Nov 2026 03:31:38 -0800 (PST)
Received: from acemagic-m1.tail4fb79.ts.net ([2401:7400:c804:b668:fe98:6351:c2cf:22c3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm7134347eec.16.2026.11.20.03.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:31:38 -0800 (PST)
From: Ho Jie Feng <hjf3108@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>,
	linux-wireless@vger.kernel.org
Cc: Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH rtw-next v3 4/5] wifi: rtlwifi: usb: move the radiotap headroom size to usb.h
Date: Fri, 20 Nov 2026 19:31:13 +0800
Message-ID: <20261120113116.153232-5-hjf3108@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261120113116.153232-1-hjf3108@gmail.com>
References: <20261120113116.153232-1-hjf3108@gmail.com>
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

Let drivers use the same define to add headroom for the frames
split out of aggregated transfers.

Move __RADIO_TAP_SIZE_RSV to usb.h as RTL_RADIO_TAP_SIZE_RSV
so chip specific code can use it.

Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
Acked-by: Ping-Ke Shih <pkshih@realtek.com>
---
 drivers/net/wireless/realtek/rtlwifi/usb.c | 8 ++------
 drivers/net/wireless/realtek/rtlwifi/usb.h | 1 +
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtlwifi/usb.c b/drivers/net/wireless/realtek/rtlwifi/usb.c
index d7b3192262..5aca1a49ca 100644
--- a/drivers/net/wireless/realtek/rtlwifi/usb.c
+++ b/drivers/net/wireless/realtek/rtlwifi/usb.c
@@ -488,8 +488,6 @@ static unsigned int _rtl_rx_get_padding(struct ieee80211_hdr *hdr,
 #endif
 }
 
-#define __RADIO_TAP_SIZE_RSV	32
-
 static void _rtl_rx_completed(struct urb *_urb)
 {
 	struct rtl_usb *rtlusb = (struct rtl_usb *)_urb->context;
@@ -521,7 +519,7 @@ static void _rtl_rx_completed(struct urb *_urb)
 		hdr = (void *)(_urb->transfer_buffer + RTL_RX_DESC_SIZE);
 		padding = _rtl_rx_get_padding(hdr, size - RTL_RX_DESC_SIZE);
 
-		skb = dev_alloc_skb(size + __RADIO_TAP_SIZE_RSV + padding);
+		skb = dev_alloc_skb(size + RTL_RADIO_TAP_SIZE_RSV + padding);
 		if (!skb) {
 			pr_err("Can't allocate skb for bulk IN!\n");
 			goto resubmit;
@@ -533,7 +531,7 @@ static void _rtl_rx_completed(struct urb *_urb)
 		skb_reserve(skb, padding);
 
 		/* reserve some space for mac80211's radiotap */
-		skb_reserve(skb, __RADIO_TAP_SIZE_RSV);
+		skb_reserve(skb, RTL_RADIO_TAP_SIZE_RSV);
 
 		skb_put_data(skb, _urb->transfer_buffer, size);
 
@@ -570,8 +568,6 @@ static void _rtl_rx_completed(struct urb *_urb)
 	usb_anchor_urb(_urb, &rtlusb->rx_cleanup_urbs);
 }
 
-#undef __RADIO_TAP_SIZE_RSV
-
 static void _rtl_usb_cleanup_rx(struct ieee80211_hw *hw)
 {
 	struct rtl_priv *rtlpriv = rtl_priv(hw);
diff --git a/drivers/net/wireless/realtek/rtlwifi/usb.h b/drivers/net/wireless/realtek/rtlwifi/usb.h
index b873bbc9c4..a7ffff2d7c 100644
--- a/drivers/net/wireless/realtek/rtlwifi/usb.h
+++ b/drivers/net/wireless/realtek/rtlwifi/usb.h
@@ -7,6 +7,7 @@
 #include <linux/skbuff.h>
 
 #define RTL_RX_DESC_SIZE		24
+#define RTL_RADIO_TAP_SIZE_RSV		32
 
 #define RTL_USB_DEVICE(vend, prod, cfg) \
 	.match_flags = USB_DEVICE_ID_MATCH_DEVICE, \
-- 
2.53.0

