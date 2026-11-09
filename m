Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794197786;
	b=TuNzTuw5IeGGeTnfv3ywJ8FM5QU1ezARYG7lqhu4Nk4A0K/bJ+/zwK1n0jbehkr8iItx
	 RaA3JA/2qBiv/bsv8R4Z7HrX+4LIsw9+XjxoKtNfkuaivA3rQ6Wmiq5xCbyRBhVjL9NvT
	 aEzRphYgTOH9koQJI6DrWpt61R5x8jzL62q/EqEzY8TgRl2OggTh6Htw5orPpPHkD/6b3
	 /nGY1G7hPL9XVbKdzD57W/KgCmcLq/5Wr0KP0q09LTHvBHr8YSaXx4yy6v2JxdGOSRJhr
	 OZjbYiZA1uhgQycMnTFvQP284j8wKVCWHUB4enLf93WWMhcpZb7vBX4oGXTF2+yZq6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794197786;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=JvfaFT4Om4gkclqm7bHhNIPAat6qqBZepmmEugF7IMg=;
	b=xWsWpATEYl0ZppjYaIQ0jhCHRP4PMiU6JnNC+57D2X1AEf0dMjS8ZM3TuOP6TA1tb4Z/
	 iCayhlqlpQv1Ivtet5gii7Fr4nTdgJI9wwPHPC6GXbUfV4tFGDlNfcCgVZIOa+6fRBr5v
	 lXgVGSPJfAcxi67dA+7Qk2iG++7yxKImJNouohmAMgnuPkQY9kG8OkybyAJNRodR+4RA/
	 H4nBtTTeDvlG2QKwR0HA/QYj7aa2q3393N0X0TdGRBPwM9TTU6WCMW5HDonGjbscO/34G
	 AzWZdSZ0PUMG07AVDOykIkvy31DZJkIyPyA2Jt45f06BoGnFWXXHzR9pwGK0wgj/vWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="I6UC/hnx";
	arc=none smtp.remote-ip=209.85.217.50
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B8C0606A31C
	for <linux-wireless@vger.kernel.org>; Mon,  9 Nov 2026 04:16:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B8C0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I6UC/hnx
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-7cc0e865dd1so140776137.1
        for <linux-wireless@vger.kernel.org>; Sun, 08 Nov 2026 20:16:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794197784; x=1794802584; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JvfaFT4Om4gkclqm7bHhNIPAat6qqBZepmmEugF7IMg=;
        b=I6UC/hnxBPoL8vHRLN2gWLdQE1GAU/lMFd0BmWiAJYsKDi1UtHcUBT79VBB4j3DqM7
         GrCwTJmNAH7CCdM60WT+YO1eGISBZyKm8gMGicMe3jlSSwhsboleqLQWjmUmQbEMls6Z
         HY9vzExvUSIqVX+foKSG4cyBzyrabd348h9OWlkis5cKdgb69BTwZ5BsGyz2ul/SQzk8
         ZajXZN/B7dL6uCNRjzhJW6as9gXTxDpqpNQQeAdZiWJUCt4byH+wthKQ6stZzkEdP2Qf
         a1cFTab07g1IMjhQBB8qUWklDIrfbif8Q9GwfBqGE14Ed9Pc8sHI3bYtUjY5vvPcncLZ
         G8bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794197784; x=1794802584;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JvfaFT4Om4gkclqm7bHhNIPAat6qqBZepmmEugF7IMg=;
        b=wNYvPP1aEGEKu8a5i0TxMQXKwzgzYALFwpuLPhMnGLQgUjB0GJ5FyfqgmG5gwO1+nU
         8Ix1HUfrswAwjenmy3TYMr626boeu+LOwu2qX+eiQcp6yra9Sko4SAsPu75nXOyuTI8p
         zbrNsia+tz7ZksXnX+ttl+weqcWAtGhvoNt2djIH9Rk3ii8MdzFnUcCGpCLf3jtuwL0h
         YvHobreX8mMOy9b75dWCixFcz5KkPjg6xVTPgfRlnobCZSxhPAIMp2/psOMP+rE4WUwF
         mjiRcRVUXpErfwjY75pk6Aqwa0M2toZfDF2MUCjke4oka/zui5UsIyHRyO5/SBVi54yO
         uvjw==
X-Gm-Message-State: APuU4Z866ENwcoB5xwQ99pZGZnKfV3+roSsAd9IT6DAIaOStDUB8CzdY
	wbdL4iNdxltSC2uu6tQ+yqBoM8r/uifcCXlSbDWK+mJ0jN3VB+yO80vfYGD2WYnbJ+XSnw==
X-Gm-Gg: AYBFou1E6l/pmC3EjnRqnmdRE5jQg2UM0vNM5RYH2aHiUNwc+vdS5n6lIIZPZeneCYG
	rq1Suw7DIUfBG/rnH5Fuk5BLsLU+W8yExocXIdDgXiLs8kgIA/PMBi8DRuSHk1q47+KV156hOXQ
	h4PqXXoGDTk+ed9GDm5pPElPb6OK93XvcJwSJdJbcDSIbVWEmWagkbphcY3foMLEWFtXcOhJ7Gt
	/g6HZfqeesM91r46olN+QCjDSMdYm0mkGOUsP86T76bw61THXnk4HrMnNXQm9pyvthdjw5FpPUh
	nmk4eF8+MHIMphhqb/MwwyFh3hqF5Udy3RlWZULFgTKGXb/toa8yyVkc5Y3MirWVnGV5eSqsEvi
	7V+EreAcommDwoHqe8dO7CjXQhN/eGX2/YmNKaYYxfcRwpTu2n9vuLwOjCj7FpYcfSPftqC52pB
	/nC7j5zZVvte7l6qVFk+E6DhhvmIsfeLzMpxhm6IMQFJ/9q+Gl0jNK2UxdyOFiXahnM0pSctZmI
	v/9jOHm1cXMzJff2U31iRtDsPHnPb5KPiDQC2N4LhQ1ciThXuuVSyoeS9Wp7BcXFRqiMEw7SinE
	kqS9jXylP3jutk6g90JotBcj6x07sWbuCCk9tAa7sKnEKnrAc4qdYBD35eoqXdYnLyJOzdZnHap
	EWA==
X-Received: by 2002:a05:6102:4243:b0:7cc:285d:4df8 with SMTP id ada2fe7eead31-7d2db05a2c1mr596407137.12.1794197784561;
        Sun, 08 Nov 2026 20:16:24 -0800 (PST)
Received: from localhost.localdomain ([2804:7f0:b501:17fd:d57b:9398:22dd:ad3])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d2db578e09sm3191867137.4.2026.11.08.20.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 20:16:23 -0800 (PST)
From: Phillipe Gustavo <phillipe.gustavo@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Phillipe Gustavo <phillipe.gustavo@gmail.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Felix Fietkau <nbd@nbd.name>
Subject: [PATCH wireless] wifi: mac80211: parse the TWT Flow field of received TWT Teardown frames
Date: Mon,  9 Nov 2026 01:16:06 -0300
Message-ID: <20261109041606.399-1-phillipe.gustavo@gmail.com>
X-Mailer: git-send-email 2.44.0.windows.1
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

ieee80211_s1g_rx_twt_teardown() passes the whole TWT Flow octet of a
received TWT Teardown frame to the driver as the flow identifier. That
octet is not just a flow id: bits 0-2 carry the TWT Flow Identifier,
bits 5-6 the Negotiation Type and bit 7 is "Teardown All TWT".

When a station sets "Teardown All TWT", the driver is asked to tear down
flow 128. mt7915 ignores such a flowid in mt7915_mac_twt_teardown_flow()
(flowid >= MT7915_MAX_STA_TWT_AGRT), so the agreement stays installed in
the firmware. The station no longer follows the TWT schedule while the AP
keeps restricting delivery to the service periods, so downlink frames are
sent while the station is dozing.

Seen with a Samsung Galaxy S26 Ultra on an MT7981 AP (Xiaomi AX3000T,
OpenWrt 25.12.6). The station sets up an individual agreement and tears
it down about 200 ms later:

  STA -> AP  TWT Setup     req_type 0x0023 (Suggest, implicit, announced)
  AP  -> STA TWT Setup     req_type 0x0028 (Accept)
  STA -> AP  TWT Teardown  TWT Flow 0x80 (Teardown All TWT, flow id 0)

mt76 twt_stats still lists the agreement afterwards, the station sees
thousands of "tx failed" per minute and downlink drops from ~450 Mbit/s
to 5-10 Mbit/s until it reassociates.

Decode the field: tear down every flow id when "Teardown All TWT" is set,
otherwise pass only the flow identifier, and ignore teardowns of
broadcast agreements since only individual agreements can be set up.

With this change the agreement is removed after each teardown and
downlink stays at 300-420 Mbit/s with the TWT responder enabled.

Fixes: f5a4c24e689f ("mac80211: introduce individual TWT support in AP mode")
Cc: stable@vger.kernel.org
Signed-off-by: Phillipe Gustavo <phillipe.gustavo@gmail.com>
---
 net/mac80211/s1g.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/net/mac80211/s1g.c b/net/mac80211/s1g.c
index 4b70afa..96b9beb 100644
--- a/net/mac80211/s1g.c
+++ b/net/mac80211/s1g.c
@@ -9,6 +9,11 @@
 #include "ieee80211_i.h"
 #include "driver-ops.h"
 
+/* TWT Flow field of the TWT Teardown frame */
+#define IEEE80211_TWT_TEARDOWN_FLOWID		GENMASK(2, 0)
+#define IEEE80211_TWT_TEARDOWN_NEG_TYPE		GENMASK(6, 5)
+#define IEEE80211_TWT_TEARDOWN_ALL		BIT(7)
+
 bool ieee80211_s1g_is_twt_setup(struct sk_buff *skb)
 {
 	struct ieee80211_mgmt *mgmt = (struct ieee80211_mgmt *)skb->data;
@@ -122,9 +127,26 @@ ieee80211_s1g_rx_twt_teardown(struct ieee80211_sub_if_data *sdata,
 			      struct sta_info *sta, struct sk_buff *skb)
 {
 	struct ieee80211_mgmt *mgmt = (struct ieee80211_mgmt *)skb->data;
+	u8 flow = mgmt->u.action.s1g.variable[0];
+	u8 flowid;
+
+	if (flow & IEEE80211_TWT_TEARDOWN_ALL) {
+		for (flowid = 0; flowid <= IEEE80211_TWT_TEARDOWN_FLOWID;
+		     flowid++)
+			drv_twt_teardown_request(sdata->local, sdata,
+						 &sta->sta, flowid);
+		return;
+	}
+
+	/* only individual TWT agreements can be set up, see
+	 * ieee80211_s1g_rx_twt_setup()
+	 */
+	if (u8_get_bits(flow, IEEE80211_TWT_TEARDOWN_NEG_TYPE))
+		return;
 
+	flowid = u8_get_bits(flow, IEEE80211_TWT_TEARDOWN_FLOWID);
 	drv_twt_teardown_request(sdata->local, sdata, &sta->sta,
-				 mgmt->u.action.s1g.variable[0]);
+				 flowid);
 }
 
 static void
