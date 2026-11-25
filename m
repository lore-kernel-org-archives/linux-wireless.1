Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795640585;
	b=XJbMfxNEoxaOcZDM4TOkejww9czijrlK/TL3rjOt7vyzGP6RBdLjOdxHKy1j/cxKVfyD
	 mGYSLRiYzGjs7fIREcVnhxEtGKJcMGjcrvRjeEFAqCyOho6HC40fWmQhvJEjmKe2tFssZ
	 GJ7kUaUmKQ+TglQsGJpLEJLj2cVqOEszUbzCfrPObQmF3KNGDznAEWQapKL6UdCEke3iL
	 5ixdjSW3FqvhXxrLqCHCDktrGA28HcfXw4/ndtTvzy0zu4qdppcmfm89pGsudYxjrARWo
	 LkmX4GIBujgrW+xIDc8fnwbl0L6Oocw0yIC6RH2F5FJH3uxOQkWhN0PX5Mbh6ArgYtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795640585;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=Iq1LqV/I3EkKfuWXMTSw+B6TAIfUEFhKN+ETx366hf8=;
	b=BkwWZ8xe9bkZWDTv4oGn3gMrL+4KI5jEQ1PSvWbvPOZbyCtEQkRKkcqXm7fqsau96IHk
	 /nnV53D75/nom7YGhb0U1DXdYHyTs20Wq8n4zFRzA+t9gO/k/IxqfhTCFqgRA62sv/q6w
	 5XQGNhz0+xlBhIjfwchC1XYvoBAU4Nv5YkKJ9vrpiWcLPzb6gfexNLmb5lexspx1Z2XXZ
	 ULLl5e+jvOv3NAeA/mWSPpKABnYiEYGEa6lY4HIkkywygGJYjfoiJt6l5aVdEs/Pi5W+O
	 pP64LVFgyAGkb3UEIrUlHob40RKaLMku4Hbj1CKRJWylJMMztFrsgoqlCffdgOyF+BA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XwAZ91mV;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73E3606A323
	for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 21:03:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B73E3606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XwAZ91mV
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30bcb065bfdso6603765eec.0
        for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 13:03:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795640584; x=1796245384; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Iq1LqV/I3EkKfuWXMTSw+B6TAIfUEFhKN+ETx366hf8=;
        b=XwAZ91mV6BDDjfULap+4HLpf7UN3K43riB4F+rPMYpatSM5RDvKHlG3NraTX7GRAZF
         Uw8zN+KKIqePwA4vRuokbht6I8KHTBYmNj4kjR9KbZRilKkTinvqCCZArC2hWcWuvoKH
         ioVIkHbzwCc6gdXeD6IqpZirUfy19HzISgS7CLlmUmppOLGWxE00p3yYp4GT2cpjR93H
         R0glvZHvMd5toauT/T//6E2J5n0xQcuFPpyJ0agRty/PSKrxUwtEYTuzwi95uCfzWZYB
         XdeMFJLi6L47NRKE2sFxwI1gaXWvcGBdvBGxnEDhSwif5KrLk8o8uSHndCubh+JfDNdP
         HRrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795640584; x=1796245384;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Iq1LqV/I3EkKfuWXMTSw+B6TAIfUEFhKN+ETx366hf8=;
        b=AbRwPojXQivwTJqaWOuLB0ecbwGY2mcnVNMT9LpBa7RD33wrvM5FBPHizMy/RaJNYN
         FlS9IN985m9nc2dAN/IH0d38YleOxLLlezQGV/ka8jD03UNT7x8D3y6k+8oQMfC39sp2
         xyVmZEDmFZS5+t8XA6SAUXUiJfc+if7s3UZzqj09RdhRjVEh3LGaM+rhoKCnP/9m47uT
         I568X/4v40DE5oFhtF2QaWyMa85yIb027VSaGSe2Dn66952aF6gl1m4nAE4MkLtPLDZ7
         3VVoPaQ4sH/DY4iT42fCN0m2HboQa0s/01QeMICFN1GDLzFV01/DFeiDoF3ZBahG8+VG
         upfw==
X-Forwarded-Encrypted: i=1; AL+hErG/r7ofyyaSLAoQPUfXobbK3qq0xOKWBKvUupe0aJdG+MXRFzDriQxgHHkBgvT42rY4yZ7TYE48ZbuvQ5xpCg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8ynE66JTOQk6aSGpCgXFMBTE07YFL8nctsROfytks5wZfeugIa
	UIPM/vaxjiIvGJtH3DVR0Ck9oaye7xTbXZPmEZtjimzAp8jHy/mcuvGiZQua0mw0nGIPcIAJn6w
	0KA==
X-Received: from dycmv8.prod.google.com ([2002:a05:693c:2808:b0:386:c2e4:36b6])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:8209:b0:383:e7af:c28d
 with SMTP id 5a478bee46e88-3856f14d5b2mr19627407eec.9.1795640583471; Wed, 25
 Nov 2026 13:03:03 -0800 (PST)
Date: Wed, 25 Nov 2026 21:01:58 +0000
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261125210158.1280227-1-elkin@google.com>
Subject: [PATCH wireless] wifi: nxpwifi: fix UAF after skb_realloc_headroom()
 in bridged RX
From: Elkin Cruz <elkin@google.com>
To: Jeff Chen <jeff.chen_1@nxp.com>, Johannes Berg <johannes@sipsolutions.net>
Cc: Francesco Dolcini <francesco@dolcini.it>, linux-wireless@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, irogers@google.com, 
	Elkin Cruz <elkin@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

In nxpwifi_uap_queue_bridged_pkt(), uap_rx_pd and rx_pkt_hdr point into
the original skb->data buffer. If skb_headroom(skb) is less than
NXPWIFI_MIN_DATA_HEADER_LEN, skb_realloc_headroom() allocates a new skb
and kfree_skb() frees the old skb, leaving uap_rx_pd and rx_pkt_hdr
dangling when updating station and bridge statistics (in addition to
rx_pkt_hdr->eth803_hdr.h_source having been partially overwritten in the
SNAP-to-Ethernet-II header move).

Cache rx_rate and ht_info from uap_rx_pd once packet bounds are verified
and read h_source and h_dest via p_ethhdr = (void *)skb->data after the
headroom reallocation block.

Fixes: 73b01e57ed3e ("wifi: nxp: add nxpwifi driver for IW61x")
Cc: stable@vger.kernel.org
Signed-off-by: Elkin Cruz <elkin@google.com>
---

I am trying out new Clang static analysis checks for kernel bug
classes, and they flagged this code as possibly buggy. The findings
were triaged/fixed and commit descriptions were drafted with help of AI,
then checked against linux-next (not runtime-tested on hardware).

Thanks,
Elkin

 drivers/net/wireless/nxp/nxpwifi/uap_txrx.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/nxp/nxpwifi/uap_txrx.c b/drivers/net/wireless/nxp/nxpwifi/uap_txrx.c
index 840dddfc4f5a..c3191575db17 100644
--- a/drivers/net/wireless/nxp/nxpwifi/uap_txrx.c
+++ b/drivers/net/wireless/nxp/nxpwifi/uap_txrx.c
@@ -84,6 +84,7 @@ nxpwifi_uap_queue_bridged_pkt(struct nxpwifi_private *priv,
 	int hdr_chop;
 	struct ethhdr *p_ethhdr;
 	struct nxpwifi_sta_node *src_node;
+	u8 rx_rate, ht_info;
 	int index;
 
 	uap_rx_pd = (struct uap_rxpd *)(skb->data);
@@ -105,6 +106,9 @@ nxpwifi_uap_queue_bridged_pkt(struct nxpwifi_private *priv,
 		return;
 	}
 
+	rx_rate = uap_rx_pd->rx_rate;
+	ht_info = uap_rx_pd->ht_info;
+
 	if ((!memcmp(&rx_pkt_hdr->rfc1042_hdr, bridge_tunnel_header,
 		     sizeof(bridge_tunnel_header))) ||
 	    (!memcmp(&rx_pkt_hdr->rfc1042_hdr, rfc1042_header,
@@ -178,18 +182,19 @@ nxpwifi_uap_queue_bridged_pkt(struct nxpwifi_private *priv,
 	tx_info->bss_type = priv->bss_type;
 	tx_info->flags |= NXPWIFI_BUF_FLAG_BRIDGED_PKT;
 
+	p_ethhdr = (void *)skb->data;
 	rcu_read_lock();
-	src_node = nxpwifi_get_sta_entry(priv, rx_pkt_hdr->eth803_hdr.h_source);
+	src_node = nxpwifi_get_sta_entry(priv, p_ethhdr->h_source);
 	if (src_node) {
 		src_node->stats.last_rx = jiffies;
 		src_node->stats.rx_bytes += skb->len;
 		src_node->stats.rx_packets++;
-		src_node->stats.last_tx_rate = uap_rx_pd->rx_rate;
-		src_node->stats.last_tx_htinfo = uap_rx_pd->ht_info;
+		src_node->stats.last_tx_rate = rx_rate;
+		src_node->stats.last_tx_htinfo = ht_info;
 	}
 	rcu_read_unlock();
 
-	if (is_unicast_ether_addr(rx_pkt_hdr->eth803_hdr.h_dest)) {
+	if (is_unicast_ether_addr(p_ethhdr->h_dest)) {
 		/*
 		 * Update bridge packet statistics as the
 		 * packet is not going to kernel/upper layer.
-- 
2.56.1.839.g22a8290db9-goog

