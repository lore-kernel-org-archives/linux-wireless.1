Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795640515;
	b=tNMQ1Sfhk63lUJeeleekFNIWEcC9zL+lc6usc+/x4J4XIbak8xTly6stjpJmczuSEqza
	 07odspA6ANJ7dzzS3CtawrwcsB6zLVFEDoi8XB5jdM6alj/s0I17UNVEas0NmGfDzY08h
	 f1e8s8gaVN7YLar3rkWnYEDIZxh7M0NB0BeGc5Y1udGS1Ho0Bq58PYsHHOOWN5qfwsLJT
	 I+wSh4LDEnINfsti1bug7Avn5YN3BqNFCiv77L3obiQNRGVqn/o4u0vV+EsutD6hWk3/4
	 q1cgcDP5tZpKQzZBf5SsWiLh6yrFHhbhKQX4pjIpiH5JMuptITUJa91RXh6Ndd3V9tA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795640515;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=0XXWYJBR6k87H5cikH0sP2tdrFWPZl3Z6YSh/gr4s90=;
	b=SmUog0uKzIPQ/+VkjM8ndzmzjql0+TFC9qLr5M9YAttIkZEZreajYNaEUovSsOj0ufNn
	 BZAOf/KrRC35i9OAeKHV5NsdXV/d5cTaNRWNrMgEjP4tiW2c/tLmNMAVcZd+5dYUoUiZ9
	 tjKUmjXnql9Kltj7r0AxOnGKtdwjUTFzpFq8DNLQ5JKtamJm5FFZvvzCEB/+qJD8vaxcF
	 zQOdNsjWy6Lf3QYoJeGO++H1ocY8YmTfd8pGquhUozOM0q/klacLXr2GmYnUkpHVJQlT5
	 fvUjxUaxIlf2l/pk1/BHBeuO2AAyF/A6mrwdW+as+AYabxlBmONlbyVn4WqORNu7kKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZjgrQBFO;
	arc=none smtp.remote-ip=74.125.82.72
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8FF606A323
	for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 21:01:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B8FF606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZjgrQBFO
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-14373747468so6008297c88.1
        for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 13:01:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795640514; x=1796245314; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0XXWYJBR6k87H5cikH0sP2tdrFWPZl3Z6YSh/gr4s90=;
        b=ZjgrQBFOqFqPbNIdl6RnJl/EBSHkorvsi6ww+mywK3uzDxNVRR6TQhRFQoQOBB6amF
         cS4Ip2KKMLFtdjAGv2erqlXspedo4FRUuLZiIwGOKrLXdh2WVvQ6BZEyDe+hu4RVZHs7
         8tB99CPjMIKJfdq0kZjb5eJeAckogRm010oQE3sbeBNWp8+UJKTnhbvZUUThHlNDEs7z
         JMtJuGB/YAil7KFsyYox73vy9nNqef2ubSPPVT/Sz9shTpo0Ohp+GmAa9HnCz3dJwpwX
         ssjOvm8n16sz8esNujKWrED3aXiNoYq2Bju2Yf8bnSXfARpYeK7hcE0POt8h/lE3Rrj0
         AmYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795640514; x=1796245314;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0XXWYJBR6k87H5cikH0sP2tdrFWPZl3Z6YSh/gr4s90=;
        b=XpuKYNxZXq6AbiLyOQ5/zX4jZmA5oXpGVA3a5Tiv8HWlpAgm90tMNVSYUWQNY2xuu7
         jwU/VK+TtxHHWwkntggPUdMc/M/NawJtovpQzEuaX6CesFbbvnUFvAsWvWsbNpfwAvai
         7fdxBaadef8DSL58yPlztg6d/joJQ4sENX2QLk9RQKhiUXvn+qOmLQGp9uiLI3uiTepr
         sa6B4mw26yn/oJO4MdjJRypWE54QnZHrx20D7gPJ7Q7TT4MqkW85NEbhUBt2sy6+P5xB
         1nRjx67L12ogxaykkJgmT86bzdZMFrztXCm6kOJ2hVw0M6CirxHxJ8hB8jFVZ5Ug/CZa
         l90A==
X-Forwarded-Encrypted: i=1; AL+hErFUfbFetzGmf/qPQvvUdjRqDAlrJW4sRJ60yhXmGgajiSEvxsp5phAe6yitTrN0AO/viAKl1PshcKWrNRFZaw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8JbWemj7Lfy5tthurJys1Q4Vs9dOhRgtoeNqUaKAQwuWI3Ph4l
	KUVHEQpeYE4NuYO4hXPs5gmdVd5zf7cJ1mCJ204lR2M11Dyr7bbdAFKnTeA1PAbss3t51cL+ugW
	Cpw==
X-Received: from dlbuu1.prod.google.com ([2002:a05:7022:7e81:b0:1b2:6c20:7e86])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:45a7:b0:1b5:4eec:14e5
 with SMTP id a92af1059eb24-1b55687f18fmr26708145c88.6.1795640514079; Wed, 25
 Nov 2026 13:01:54 -0800 (PST)
Date: Wed, 25 Nov 2026 21:00:36 +0000
In-Reply-To: <20261125210038.1277960-1-elkin@google.com>
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261125210038.1277960-1-elkin@google.com>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261125210038.1277960-2-elkin@google.com>
Subject: [PATCH wireless 1/3] wifi: mwifiex: fix UAF after skb_realloc_headroom()
 in bridged RX
From: Elkin Cruz <elkin@google.com>
To: Brian Norris <briannorris@chromium.org>
Cc: Francesco Dolcini <francesco@dolcini.it>, linux-wireless@vger.kernel.org, 
	Johannes Berg <johannes@sipsolutions.net>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, irogers@google.com, Elkin Cruz <elkin@google.com>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

In mwifiex_uap_queue_bridged_pkt(), uap_rx_pd and rx_pkt_hdr point into
the initial skb->data buffer. When skb_headroom(skb) is smaller than
MWIFIEX_MIN_DATA_HEADER_LEN, skb_realloc_headroom() allocates a new skb,
kfree_skb() frees the original skb, and skb is updated to new_skb,
leaving uap_rx_pd and rx_pkt_hdr dangling. Subsequent reads of
rx_pkt_hdr->eth803_hdr.h_source, uap_rx_pd->rx_rate, uap_rx_pd->ht_info,
and rx_pkt_hdr->eth803_hdr.h_dest dereference the freed skb (and in the
RFC1042/SNAP conversion branch, rx_pkt_hdr->eth803_hdr.h_source was also
partially overwritten in-place when constructing the Ethernet II header).

Save rx_rate and ht_info from uap_rx_pd after the packet length check
and re-derive p_ethhdr from the live skb->data after any headroom
reallocation, since skb_pull() already positioned skb->data at the
Ethernet header in both header-conversion branches.

Fixes: f7b598532f3d ("mwifiex: update statistics for bridged packets on AP interface")
Fixes: 442f6f9b49c8 ("mwifiex: maintain station statistic in uap mode")
Cc: stable@vger.kernel.org
Signed-off-by: Elkin Cruz <elkin@google.com>
---
 drivers/net/wireless/marvell/mwifiex/uap_txrx.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/marvell/mwifiex/uap_txrx.c b/drivers/net/wireless/marvell/mwifiex/uap_txrx.c
index 318bd4ed8399..d2512b985014 100644
--- a/drivers/net/wireless/marvell/mwifiex/uap_txrx.c
+++ b/drivers/net/wireless/marvell/mwifiex/uap_txrx.c
@@ -89,6 +89,7 @@ static void mwifiex_uap_queue_bridged_pkt(struct mwifiex_private *priv,
 	int hdr_chop;
 	struct ethhdr *p_ethhdr;
 	struct mwifiex_sta_node *src_node;
+	u8 rx_rate, ht_info;
 	int index;
 
 	uap_rx_pd = (struct uap_rxpd *)(skb->data);
@@ -113,6 +114,9 @@ static void mwifiex_uap_queue_bridged_pkt(struct mwifiex_private *priv,
 		return;
 	}
 
+	rx_rate = uap_rx_pd->rx_rate;
+	ht_info = uap_rx_pd->ht_info;
+
 	if ((!memcmp(&rx_pkt_hdr->rfc1042_hdr, bridge_tunnel_header,
 		     sizeof(bridge_tunnel_header))) ||
 	    (!memcmp(&rx_pkt_hdr->rfc1042_hdr, rfc1042_header,
@@ -183,16 +187,17 @@ static void mwifiex_uap_queue_bridged_pkt(struct mwifiex_private *priv,
 	tx_info->bss_type = priv->bss_type;
 	tx_info->flags |= MWIFIEX_BUF_FLAG_BRIDGED_PKT;
 
-	src_node = mwifiex_get_sta_entry(priv, rx_pkt_hdr->eth803_hdr.h_source);
+	p_ethhdr = (void *)skb->data;
+	src_node = mwifiex_get_sta_entry(priv, p_ethhdr->h_source);
 	if (src_node) {
 		src_node->stats.last_rx = jiffies;
 		src_node->stats.rx_bytes += skb->len;
 		src_node->stats.rx_packets++;
-		src_node->stats.last_tx_rate = uap_rx_pd->rx_rate;
-		src_node->stats.last_tx_htinfo = uap_rx_pd->ht_info;
+		src_node->stats.last_tx_rate = rx_rate;
+		src_node->stats.last_tx_htinfo = ht_info;
 	}
 
-	if (is_unicast_ether_addr(rx_pkt_hdr->eth803_hdr.h_dest)) {
+	if (is_unicast_ether_addr(p_ethhdr->h_dest)) {
 		/* Update bridge packet statistics as the
 		 * packet is not going to kernel/upper layer.
 		 */
-- 
2.56.1.839.g22a8290db9-goog

