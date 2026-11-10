Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794297727;
	b=hNIXqy6oDxEEDxJFkf2qY6dFReQMJH6PAYYfl+AF+7rsWqkNIzIam9SpmZpUWyve9RGq
	 UVB2EmkPvANpL+8c2TQ4lNkv7meXnd9GROs8vOXITALlac2VEVSBqzC+Z5JcACcfnLg7J
	 orQjhMGeOar5ps6u79I/S50c8UvwQCP9uQ7htggsyUcTUcduRmIStSBR5fhb/CrHAUndg
	 5sD0+rkVySThJqonUCUFxLeaWuC4fL6vqc1XMQS81d2+G+eFYh65SMpD2KvPaJMteGZdV
	 YdNhy/3ayWcfu8/GI1mNtxE3nzLYlsBrDLnSz1Esnf0LEMhcdW779INdJsvmFUtJ8pA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794297727;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RQs+HNSQFFVFy2bmuw37lif8a3ns+w4oxEupotElbYQ=;
	b=z9woRP3TQW1n4aV6/6lMJU5WyzjBovHRE+AEYU4EPgzH3CoEvDmHImokbq9kz4Ya4r5H
	 OkMrdfAfnjCBU3poZdhm9NrUIIDudfwh5okVwM+FJjy6/EYfWVTnA5FIoH9BzMj41vGQt
	 Dkn6OffKuH5BE7QdU+BUuybVzi++3gYIOJH3ql7JLAxCdwzifogNhQAxVgDySk4z90Ly0
	 tdXuznCufXhyvikuTAjGPVRTllhptVy/8KH5xSAi5x358X9XcEIYhIVkmJYhlNkCvO5r8
	 8VPNJONcLGJxuLMXQfoVy3vMNHnTZ+lCYaGHBO+gdKETS9toJPRv3vFcACizgZVpjsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wAJ5NYtY;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C61B6077D7A
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 08:02:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C61B6077D7A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wAJ5NYtY
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3b09a83d12aso1193644a91.2
        for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 00:02:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794297727; x=1794902527; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RQs+HNSQFFVFy2bmuw37lif8a3ns+w4oxEupotElbYQ=;
        b=wAJ5NYtYv34P7kk8zSV77PXr0jZ+VkCCQjnj6+OgVYDzR4Amzp/PzJ7K8agRGir9rR
         ZQxC669wIApFZek5Cv0Nt/4JWxbuhG/ouE+pv6ytXwatg4yBnKH5YCLXxsEklPAYWHg9
         f37+FetNKxDiCSKff0U9L3uAJvkV4tDRqDE9nMQFTLFh7Y89XeSEDQKnFx5/HwpLrk4i
         pGb3T19OG6iQzPv0EBqRvUPBdSftfkPfiKEHOZTXfU992xjuWODLYMQdMcYXas7CeaJ9
         VxvHIUxTN16hcv900VtorhcXhY+zKp1tBHKs3JK764UTB3uneZ7OPdeYL0vAr1YDSkZ3
         aCgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794297727; x=1794902527;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RQs+HNSQFFVFy2bmuw37lif8a3ns+w4oxEupotElbYQ=;
        b=nFWv52u4tbxStVgmWXdf5A4kRSogMqCUOk/zXg1J8182Kkosx0FloAie7t/D0vlSTf
         nwowCwGuaLe8j0B6KEO7uPtw5D9Y7/fb6w5pJcR0YqLdx2vr7xhm73KclfwlhqjnWLkv
         ytUZ8eAdaPeVoX0d0rJ9mL2T6gkNLVumLmZVm03s+cWf/5GwJxLQqMUWXRLiWqxPvZ+U
         s0q5gNTM+FxwBfb05ndNAViVPMPk059bfm8h88Mfxhj7czuENxufucxro3EZ1xfAe3f6
         +nj1xFihUQR43+aqiIZWDTrLk7wfPbkY5hWL3sq8EWeZbFpkFAA+ivj4s4ApudVdWrkx
         gTxg==
X-Forwarded-Encrypted: i=1; AL+hErFSg4uS4nxbKBrEahVVVTnSVrWXzJdLqbwGbYBcLyzWw0k3T0xABqSy3W+gP05/Twy+t7qxCriEptJIeN076w==@vger.kernel.org
X-Gm-Message-State: APuU4Z/j57nuUj+msthhspq8ssCoxBHvSA7GNuS8NnRW6Ia+IMycPekI
	aM2lUz/Zrnb/IjiipT7BJAExj/AkFtNfkZhvOuVXb6zW0fqWd5LZ3n+tvAttbVvjoyY5Rw==
X-Gm-Gg: AYBFou0ugfpeh8f1WqmyuL8wV3WnEB6rU8+VlhOoCW+eNIUrXBPk3EhvDjxE940GJVi
	CeMQwRPzFzi1HYAowA0/aTp64Cpb1SDxa2ulZiWRF3gO69/U8YqOlECv847caCJ5zv2kCbbdyT/
	GoQxqdrVg/HdKpiruwNtIQf053DuIXxcIxKKK4CvDq0yvAVmTgcg+aaq1adB6Wm8uA4IiFzebS9
	NKQhZB676ascBRXXW2Sm+5S7rfuGu7wJXt6nePZL9R1RteOj7bVgFuuD0fXuofOsd2206Bpcqbm
	GZBudzAWPPjqQaTg2zQ5T+BmEPmGYdiXWK0JkVN66B/CU0GWKkUHYG/+D9hiob+F7BmPine/ptF
	Jn7ZRe+ynLPWelI6N9RBqutWQIfOMzEsOGHFK/bfnrCMOO/j/xutqnJpErxvLI40F7YKHZ2uTCD
	CetX79gIQCjAQXM7/c/UrnZVOEtrk4MMNExSrq8qZ+2KkXrKcGi0JSDi33li9bZN8Yn7Y61aJMR
	Najd9xbEIQgZlCvl4ZEjLfwL8ewigjG9AfOGTNkgFZsOeKjYCOCiqRgzvRWmor8+iM4iXqRhxve
	xNSq1BEtzhh+LxdI9YT8BzrNCP6/T2yqUbWMI19VSGqFTZETVLJ4PuWSr5zj4I4GTZE8nEyQltN
	26YPZUQPBBCd4IBKd8iEiSU9M41rf4Q==
X-Received: by 2002:a17:90b:55c6:b0:3ac:4291:f569 with SMTP id 98e67ed59e1d1-3b166ae70f5mr2060519a91.8.1794297726471;
        Tue, 10 Nov 2026 00:02:06 -0800 (PST)
Received: from acemagic-m1.tail4fb79.ts.net ([2401:7400:c804:b668:b87c:eff1:b55f:23de])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1678ceda0sm2906627a91.5.2026.11.10.00.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 00:02:06 -0800 (PST)
From: Ho Jie Feng <hjf3108@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>,
	linux-wireless@vger.kernel.org
Cc: Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH rtw-next v2 4/5] wifi: rtlwifi: usb: move the radiotap headroom size to usb.h
Date: Tue, 10 Nov 2026 16:01:40 +0800
Message-ID: <20261110080143.1362021-5-hjf3108@gmail.com>
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

Let drivers use the same define to add headroom for the frames
split out of aggregated transfers.

Move __RADIO_TAP_SIZE_RSV to usb.h as RTL_RADIO_TAP_SIZE_RSV
so chip specific code can use it.

Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
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
index b873bbc9c4..329b734ca1 100644
--- a/drivers/net/wireless/realtek/rtlwifi/usb.h
+++ b/drivers/net/wireless/realtek/rtlwifi/usb.h
@@ -7,6 +7,7 @@
 #include <linux/skbuff.h>
 
 #define RTL_RX_DESC_SIZE		24
+#define RTL_RADIO_TAP_SIZE_RSV	32
 
 #define RTL_USB_DEVICE(vend, prod, cfg) \
 	.match_flags = USB_DEVICE_ID_MATCH_DEVICE, \
-- 
2.53.0

