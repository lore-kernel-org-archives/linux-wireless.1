Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108060;
	b=H+swy4i0CIOH5wLUkGtqledSHWHV54PjN+urBYWQyQqCifSy4dGzbzHf1b6gqOStPoT1
	 cIn5F7aRX7TSmSCy2ARucNH2tB5p389AbmBcstevOqbQjZBvomE1xyP7oFptqClO6keke
	 FSj/1YIdyeOuuegMmQx+3rCUXlt/GtCbBo5BervEXR+9DHrtKIu4yOcVs+BvnTZo1txYP
	 Y/g4Sp7Y9SXs5zKzUXg/t/qoNE4Q/yaz6G27+8V+mn/gdvymfD9vaJX3d+OA3aArnMD9m
	 gqCX/HTHap4otmGbn/JtrVF4+RkgajDCBwNMgpvvMoZB0UuCehgcI1pkrVlR6SJj7bA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108060;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:Mime-Version:X-Mailer:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=40uF70Y8a7Zl+4wCt7nPsMMR0NTjvrY903p4D0/j04w=;
	b=eihMwX1JUIBJClLRFv6X6iDYb95QBwbHd6nSXVR/O5THfuxEoKKKRKLSeWIpszDQWs3t
	 CYqPCqe4KjYfqPHLaG3uLHzDII/D/DOB706EB4IJ4H53GNn7+Ujo8Vs3k4gGhg9xDZcEd
	 DnW6fo0muLBvG6tZ53OANdMwQPBJos+4RLn1/2qmd7Oe+b0P+0DdC+Du+8JohpOe1PWDs
	 U57mrdTMEtNAMqCPhrcB/ALqEORKT6lQAiORLXFQ3yiiTyPji2nmILV4o5yLVfSx72iGY
	 kGiWb9f1vQ3EWta+8OLh4t9Tdi2fjU9oAxWqkdh7a7imD6jiIvKqlEmYccilSXvwwcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QHp06z+X;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1F2E606A33E
	for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 17:07:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1F2E606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QHp06z+X
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-38355b03cb8so1729610eec.0
        for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 09:07:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795108059; x=1795712859; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=40uF70Y8a7Zl+4wCt7nPsMMR0NTjvrY903p4D0/j04w=;
        b=QHp06z+XHHiK9pptcoJ6EcsFlu0ESXX1C8xacGrtXzP7AJskJyIFe0gq7w1jxxPYv6
         Vy3xb3i2OmEe+gqqEL3GellvKtJSKfZQyuSKAs3HkZUddPXK3G8I5eRxGzcEUbEQVcNl
         EfVGyuooQ5Z/Olfl70/SGLP+P7HHS9fmksmPfqyJC6Mq9u5AoyoiFHHiWn2g6fF2AaZC
         YnWjWYuVy9HBFX7vvZnslYwRVKt2dhJJUP4GiN6PtmJLzJQWs7phaUQt/k0hVweZPJ7F
         YINIwb9J6AChUOgAyLV8W0A+/I9MGKIb2tKat/02x6MkL3YzDbXV6MsoQL658IsR0zRt
         vw1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108059; x=1795712859;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=40uF70Y8a7Zl+4wCt7nPsMMR0NTjvrY903p4D0/j04w=;
        b=GLW8j+H3ndI2Avk1TMeBBXEhyD9ZE6MHZLdj3dsodJnkMZMtDueTicl2nLyDnmU81V
         MCeFOryMQC6ULh9giyqevLmUSKC0/Y+KcD5cqcYOG6efzDIlUPruFXekCNrOYYu+KEze
         7hb+owT+rs6lgQTd2SeU+f4BwX1cJjpBB9ZXgg1/k+UT9VFYhs1e7CbKwDgAUgEqQ7Kk
         /RP2nnUBKbZRCrJqrhFWAzcTjse8qqlxDWOGyPwuFB+B1Xw/SsFZo+UYkd6m+gcE0LpC
         fADnOqCXAuBg3VT6m4BHI4Cb2pmH/o4ON9BFdoufAdfesSdXG1QXsO9ncAWBhFBGU+5+
         Qdvg==
X-Gm-Message-State: APuU4Z8lvQFSZe3ebnzJqnvBkFP56hGPq+kiz3YOckxMSwpSkRHiYtbT
	EPJh+FCR9uQ+CDDOEosviOJuscjxroU8qablWjdHL68NJcYRIDt46hXVjudEQT2X7lGIZ6Df7gC
	k1gQN1y1jcQ==
X-Received: from dybhc28.prod.google.com ([2002:a05:7301:29c:b0:36a:de0:d28a])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:3f16:b0:36e:a321:5353
 with SMTP id 5a478bee46e88-3856c5b5615mr22305eec.2.1795108058821; Thu, 19 Nov
 2026 09:07:38 -0800 (PST)
Date: Thu, 19 Nov 2026 09:07:35 -0800
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261119170735.1524873-1-irogers@google.com>
Subject: [PATCH] wifi: wilc1000: Fix skb leaks and return types in wilc_wfi_mon_xmit()
From: Ian Rogers <irogers@google.com>
To: Ajay Singh <ajay.kathat@microchip.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

wilc_wfi_mon_xmit() is an .ndo_start_xmit handler returning netdev_tx_t,
where negative return codes (< NET_XMIT_MASK) are treated by
dev_xmit_complete() as packets already consumed by the driver:

1. On the broadcast deauthentication path, if dev_alloc_skb() fails it
   returns -ENOMEM without freeing skb; if dev_alloc_skb() succeeds, it
   copies skb->data into skb2, passes skb2 to netif_rx(), and returns 0
   without ever freeing the original skb.
2. On the management frame path, mon_mgmt_tx() returns a negative errno on
   allocation failure, which was stored in u32 'ret' and returned as
   netdev_tx_t after freeing skb.

Free skb via 'goto drop' on skb2 allocation failure, consume skb with
dev_consume_skb_any() after cloning into skb2, remove the impossible
!netdev_priv(dev) check, and return explicit netdev_tx_t values across all
paths.

Found via an x86_64 LLVM=1 (Clang 21.1.8) allyesconfig audit with
-Wassign-enum enabled; fix and changelog drafted with an AI coding
assistant. Build-tested under LLVM=1 W=1 (-Werror), -Wassign-enum, and
-Wimplicit-int-enum-cast; not tested on Microchip WILC1000 hardware.

Fixes: 5625f965d764 ("wilc1000: move wilc driver out of staging")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 drivers/net/wireless/microchip/wilc1000/mon.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/microchip/wilc1000/mon.c b/drivers/net/wireless/microchip/wilc1000/mon.c
index 9b8c083b403d..8bee46651c61 100644
--- a/drivers/net/wireless/microchip/wilc1000/mon.c
+++ b/drivers/net/wireless/microchip/wilc1000/mon.c
@@ -145,16 +145,15 @@ static netdev_tx_t wilc_wfi_mon_xmit(struct sk_buff *skb,
 	struct ieee80211_radiotap_header_fixed *rtap_hdr;
 	struct ieee80211_hdr_3addr *hdr;
 	unsigned int hdr_len;
-	u32 rtap_len, ret = 0;
+	u32 rtap_len;
 	struct wilc_wfi_mon_priv  *mon_priv;
 	struct sk_buff *skb2;
 	struct wilc_wfi_radiotap_cb_hdr *cb_hdr;
 	u8 srcadd[ETH_ALEN];
 	u8 bssid[ETH_ALEN];
+	int err;
 
 	mon_priv = netdev_priv(dev);
-	if (!mon_priv)
-		return -EFAULT;
 
 	if (skb->len < sizeof(*rtap_hdr))
 		goto drop;
@@ -178,7 +177,7 @@ static netdev_tx_t wilc_wfi_mon_xmit(struct sk_buff *skb,
 	    is_broadcast_ether_addr(hdr->addr1)) {
 		skb2 = dev_alloc_skb(skb->len + sizeof(*cb_hdr));
 		if (!skb2)
-			return -ENOMEM;
+			goto drop;
 
 		skb_put_data(skb2, skb->data, skb->len);
 
@@ -202,8 +201,9 @@ static netdev_tx_t wilc_wfi_mon_xmit(struct sk_buff *skb,
 		memset(skb2->cb, 0, sizeof(skb2->cb));
 
 		netif_rx(skb2);
+		dev_consume_skb_any(skb);
 
-		return 0;
+		return NETDEV_TX_OK;
 	}
 	skb->dev = mon_priv->real_ndev;
 
@@ -214,15 +214,14 @@ static netdev_tx_t wilc_wfi_mon_xmit(struct sk_buff *skb,
 	 * fields are equal send it to mgmt frames handler
 	 */
 	if (!(memcmp(srcadd, bssid, 6))) {
-		ret = mon_mgmt_tx(mon_priv->real_ndev, skb->data, skb->len);
-		if (ret)
+		err = mon_mgmt_tx(mon_priv->real_ndev, skb->data, skb->len);
+		if (err)
 			netdev_err(dev, "fail to mgmt tx\n");
 		dev_kfree_skb(skb);
-	} else {
-		ret = wilc_mac_xmit(skb, mon_priv->real_ndev);
+		return NETDEV_TX_OK;
 	}
 
-	return ret;
+	return wilc_mac_xmit(skb, mon_priv->real_ndev);
 
 drop:
 	dev_kfree_skb(skb);
-- 
2.56.1.708.g77570a6a1d-goog

