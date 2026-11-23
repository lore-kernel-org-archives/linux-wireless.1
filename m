Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795441815;
	b=LW8SJruvKPe+5R12MT9FtM2L486gcmRDgf78ZpN6pUZiWIEdcRhe6+/VqC9Phh5nfMUO
	 go7VqTkDNG2bFxHhFEiRu1DtcskR20qYjaXUU3EGLp0SZL5O6UmHVZXVK/gmPIPxHH6nM
	 wZgkGdm7IyJlKvKVl4a8Gn75oTUzkxbTo9GZv7OdK/U74iyo5fEUx+a1FXo+sCXHXHiKW
	 7C377C0mIMjAhJcS/ZPVBaRPON2qvaycfrdlyavKfk/t4+MnkzWvlK1otGd076m111TP+
	 qEb263JIezrV6XtfBMcrlxu+4I8e+honMi93aENmLhIyoFt6CsGiETIGGWlH0xqhsiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795441815;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=57ma+zgU22rM4nTYnM4SGAl9X+VUD738fpDOy0Jctx4=;
	b=yLPXz0iNYsLB7kuDwl1W1MqP1YolhiuXlvTTlJsT77oGFDYkY7/qDqy+4qbRO+WpMYCu
	 IHT+fXsQAwNUBJxwbkouGT96RTPkSibGUxt2xvrRtjeWMe5U9p7AmuBIuoCdWjg+EDdMo
	 OrPI+hNsjOJtvQGTXxdh4blg667vJl4nBeYwzEvzk3g3ZLEA0l8yr0MOObY6gNYDUTqrc
	 WNqu2cJaGtlXI0N0igzid7pfOqOTqNXXv2hBsTLqNqs5sHi9G7+Qt8KTl5lGaQ7s5IuRg
	 h3j8n5O9lXQHvLFk4Y2x2eH9W6xiQw3mWbOTnZSgMYRShQR5+sUafFFdpot8CAeEPxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=aZOHhFjX;
	arc=none smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 649BB606A32D
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 13:50:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 649BB606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=aZOHhFjX
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b8977f2785so4353155a12.3
        for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 05:50:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795441813; x=1796046613; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=57ma+zgU22rM4nTYnM4SGAl9X+VUD738fpDOy0Jctx4=;
        b=aZOHhFjXZWNwRqnUVxI2nhrrYCC/i5aaVPKAv8dyEM1i5IDLYn8oeRRxQewjsk2j+K
         eV/ZCALfeLY7Fy7phfAiNjXjVyaX85FasxnFuxHQc1pVYRPuVo8viI4nc5U37ZfPJXZk
         cYNn/QOAV+qIVTxMKxXwhsIQBFRshz57VlSga2APMHgugSBrpQAp7m9VUfsl6gjNzqt+
         TzGJZMut1ZWYl/T45wMKjpCuwvHAT8fqjSMi+vkde3BUmzzhioVXB6GFvN1wMqpS6NUE
         /8eHAGoULDcVgY6PSoyLhM2gB7tGuXZnu/4fAGMn4G4aY6BDMB150LFlmtGHLIukBbWU
         fBLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795441813; x=1796046613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=57ma+zgU22rM4nTYnM4SGAl9X+VUD738fpDOy0Jctx4=;
        b=P2zfzuXf1K1xeJEoy7UXdDFVYl6QTHIDBMxqwUBDY9PD/cnu1n59H5xYAWmcNHzca2
         3wQDujPCPiwBzGTNteQZHR1iJHT5B3NhrIswsy/kGGkbrreVDC13ruFeKwme915duM0y
         ia9d9ndjz/kBNxazB7sKl+jq5qISj2CcsvYrmmF6R4cFI7+lFMOMxhJCIkniwA0f0AYA
         aL4RjUAxXIthadpBEpi/VmMAm2CkAO2dawJ3KTaoZ7vf8IRSCgcexwCahNxpX4XyooU8
         mhKt7bTtsXMoG8W8J9gh9CXAHlxds+CltmdukS//C3wWeDIcbGASu8/ePemNyFTJZKhA
         +79g==
X-Forwarded-Encrypted: i=1; AL+hErEtUEsRWW8NKNqnHFHfBNSTGHtVqZqmKER00PgIDYyZ+Uil3/jfR0Nc85U7Qu0YJj8gM1TrP77VzJ5Kw8js3g==@vger.kernel.org
X-Gm-Message-State: APuU4Z8va2ziT9IH+pebrPTNFp7uVbAzGYBosD6ziCleklYoqsLuWQGv
	zaQOadLijGvWW2QW7Zol6DuURICDXrNx8ex+Fsa2C9lI831jCs+1ksZmYtHzo3n7DO3PZu5e1BQ
	etJiNSh7t
X-Gm-Gg: AZFdTZdpeIPSXSZjcT/V1H3aayGGrJ1aHj5zC8N+Q3dHMvEro3iYun8DzIyRkMBVzcG
	8MxGOfO2kLmrxaFAboJ04DNN3dAX8mYjCTMiLkhT6KrEAqEaOIVS9KY96HF7Mo/eAfLfUx9nvgi
	/GHqVSktyHgEx09K+v28sicrnbTQefq1BqAJcuTGMU1xavsWHPTohBE7wmm1HLaQe2qptpr1B3y
	D8iR+Nmi6188EIcYjFO5kuZ7hHmn4Ya+tabhf637tKFWM3SqFG6cearPoQRNo4Sfra7xMvOr4FI
	cSgiuAhYd+WXCAM3/1mfZHe1KKi3v1hjTQUqjUhZZLizKRbeiJJL4++ui4Mzygv9Bu+8lXCHYOf
	3Z2yrROTLoFOOJC6EfLufMK9r9wOVmlbQoX8jgPgv9DYBSq7NgMstZASvtfxQIh4DXUlsfrRsrJ
	rGd+COsGmTQJb/8Oc/sAj/UZXw0F+pJ/oUELJgtgtlya2pQj0crqEOcC2/Bi40rN1aeo42dI4/G
	iiGfWtXxxOlX9LQtLXA2koTzpdW+XZ/2nNftWNlF+jWfjU4pFD9a4Pe5EB20ykvUDcOCfjgjxry
	awVzGYDABql6I9d8ZS1BYfE99Z0StPu33pLFOrJfmiTF6oQiichXyCvd2XtUvVmtzMrYEhbptDE
	jVYnhVSmcIQrws80MmXoYrWu4NrmJ4KTikWpjnd0zmh5jBKHdYuvXj5Syi8QFHjRykHIifbliEZ
	ropCaPfxqXGgKwiuuxlCC8m3oKtvYIKcKg3CwQmytLmy36SDQPAcgx5gX1+POlWQYIVKLDoa/OB
	ldN3TJFedpMEYF226IZUtkyknPp3Df8Z57Aa0Gw1VVEADq3cjTneuqAj51RFrUb8fdMAriMHjCv
	MMNl9kXZ6FIeExRlQyuq1m80V3gZpTS6AqnbmGKiRBpAsgrH85cT423gDQEvA93ww/q6QTr5rpQ
	=
X-Received: by 2002:a05:6402:4416:b0:6ba:c87b:b53f with SMTP id 4fb4d7f45d1cf-6bac87bbebamr1384351a12.22.1795441812759;
        Mon, 23 Nov 2026 05:50:12 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f247012000e9a6b19fb24a0d13.dip0.t-ipconnect.de. [2003:f2:4701:2000:e9a6:b19f:b24a:d13])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fa8a4sm5357732a12.21.2026.11.23.05.50.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:50:12 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>,
	Johannes Berg <johannes@sipsolutions.net>
Cc: ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	P Praneesh <praneesh.p@oss.qualcomm.com>,
	Sriram R <sriram.ramachandran@oss.qualcomm.com>,
	Karthikeyan Periyasamy <karthikeyan.periyasamy@oss.qualcomm.com>,
	Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>,
	Sathishkumar Muruganandam <quic_murugana@quicinc.com>,
	Maharaja Kennadyrajan <quic_mkenna@quicinc.com>,
	Balamurugan Selvarajan <quic_bselvara@quicinc.com>,
	Venkateswara Naralasetty <quic_vnaralas@quicinc.com>,
	Govindaraj Saminathan <quic_gsamin@quicinc.com>,
	Wen Gong <quic_wgong@quicinc.com>,
	Carl Huang <quic_cjhuang@quicinc.com>,
	John Crispin <john@phrozen.org>,
	Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
	Ramya Gnanasekar <quic_rgnanase@quicinc.com>
Subject: [RFC PATCH ath-next 1/3] wifi: mac80211: count the segments of a received GSO frame
Date: Mon, 23 Nov 2026 14:50:08 +0100
Message-ID: <20261123135010.721107-2-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261123135010.721107-1-julius@bairaktaris.de>
References: <20261123135010.721107-1-julius@bairaktaris.de>
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

A driver with rx decap offload may merge consecutive in-order TCP frames
of one station into a GSO frame before it hands it over, as GRO would
on the netdev. ieee80211_rx_8023() counts every frame it takes as one:
one packet, fragment and MSDU of the station, one packet of the netdev,
and the bytes of the merged frame, which carries the headers of its
first segment only. The counters then report fewer frames and bytes
than the station sent.

Count a TCP GSO frame as its gso_segs frames, and its bytes as those of
the frames it was merged from: its length plus the headers, up to the
end of the TCP header, of every segment after the first. Any other
frame counts as before.

A merged frame to another station of the same interface takes the
internal forward of ieee80211_rx_8023(), which sets ETH_P_802_3 as the
protocol and the network header on the MAC header. The segmentation of
the frame on the way out then fails: skb_mac_gso_segment() finds no
handler for the protocol, and a driver that segments in hardware reads
the IP header at offset 0. Give a GSO frame the protocol of its
Ethernet header and its network header behind it; any other frame is
forwarded as before.

Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 net/mac80211/rx.c | 61 +++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 54 insertions(+), 7 deletions(-)

diff --git a/net/mac80211/rx.c b/net/mac80211/rx.c
index 905fd70491ce..fd7dbd4b0611 100644
--- a/net/mac80211/rx.c
+++ b/net/mac80211/rx.c
@@ -19,6 +19,7 @@
 #include <linux/export.h>
 #include <linux/kcov.h>
 #include <linux/bitops.h>
+#include <linux/tcp.h>
 #include <kunit/visibility.h>
 #include <net/mac80211.h>
 #include <net/ieee80211_radiotap.h>
@@ -4915,6 +4916,33 @@ void ieee80211_check_fast_rx_iface(struct ieee80211_sub_if_data *sdata)
 	__ieee80211_check_fast_rx_iface(sdata);
 }
 
+/*
+ * The frames a received 802.3 frame stands for: one, or the segments of a TCP
+ * GSO frame that the driver merged from consecutive frames of a stream, each
+ * of which carried the headers the merged one has. @extra is set to the bytes
+ * of those headers the merged frame no longer carries.
+ */
+static unsigned int ieee80211_rx_8023_segs(struct sk_buff *skb,
+					   unsigned int *extra)
+{
+	unsigned int segs, hdrlen;
+
+	*extra = 0;
+	if (!skb_is_gso(skb) || !skb_is_gso_tcp(skb) ||
+	    !skb_transport_header_was_set(skb))
+		return 1;
+
+	hdrlen = skb_transport_offset(skb) + sizeof(struct tcphdr);
+	if (skb_headlen(skb) < hdrlen)
+		return 1;
+
+	segs = max_t(unsigned int, skb_shinfo(skb)->gso_segs, 1);
+	hdrlen += tcp_hdrlen(skb) - sizeof(struct tcphdr);
+	*extra = (segs - 1) * hdrlen;
+
+	return segs;
+}
+
 static void ieee80211_rx_8023(struct ieee80211_rx_data *rx,
 			      struct ieee80211_fast_rx *fast_rx,
 			      int orig_len)
@@ -4925,6 +4953,8 @@ static void ieee80211_rx_8023(struct ieee80211_rx_data *rx,
 	struct sk_buff *skb = rx->skb;
 	void *sa = skb->data + ETH_ALEN;
 	void *da = skb->data;
+	struct pcpu_sw_netstats *tstats;
+	unsigned int segs, extra;
 
 	if (WARN_ON_ONCE(!link_sta)) {
 		dev_kfree_skb(rx->skb);
@@ -4964,12 +4994,17 @@ static void ieee80211_rx_8023(struct ieee80211_rx_data *rx,
 	stats->last_rx = jiffies;
 	stats->last_rate = sta_stats_encode_rate(status);
 
-	stats->fragments++;
-	stats->packets++;
+	segs = ieee80211_rx_8023_segs(skb, &extra);
+	stats->fragments += segs;
+	stats->packets += segs;
 
 	skb->dev = fast_rx->dev;
 
-	dev_sw_netstats_rx_add(fast_rx->dev, skb->len);
+	tstats = this_cpu_ptr(fast_rx->dev->tstats);
+	u64_stats_update_begin(&tstats->syncp);
+	u64_stats_add(&tstats->rx_packets, segs);
+	u64_stats_add(&tstats->rx_bytes, skb->len + extra);
+	u64_stats_update_end(&tstats->syncp);
 
 	/* The seqno index has the same property as needed
 	 * for the rx_msdu field, i.e. it is IEEE80211_NUM_TIDS
@@ -4977,8 +5012,8 @@ static void ieee80211_rx_8023(struct ieee80211_rx_data *rx,
 	 * frame, so count MSDUs.
 	 */
 	u64_stats_update_begin(&stats->syncp);
-	u64_stats_inc(&stats->msdu[rx->seqno_idx]);
-	u64_stats_add(&stats->bytes, orig_len);
+	u64_stats_add(&stats->msdu[rx->seqno_idx], segs);
+	u64_stats_add(&stats->bytes, orig_len + extra);
 	u64_stats_update_end(&stats->syncp);
 
 	if (fast_rx->internal_forward) {
@@ -4998,9 +5033,21 @@ static void ieee80211_rx_8023(struct ieee80211_rx_data *rx,
 			 * reclassifying the frame (see cfg80211_classify8021d).
 			 */
 			xmit_skb->priority += 256;
-			xmit_skb->protocol = htons(ETH_P_802_3);
-			skb_reset_network_header(xmit_skb);
 			skb_reset_mac_header(xmit_skb);
+			/*
+			 * A GSO frame is cut into its segments on the way
+			 * out, which needs the protocol and network header
+			 * it was merged with: with ETH_P_802_3 and the
+			 * network header on the MAC header, the segmentation
+			 * finds no IP header.
+			 */
+			if (skb_is_gso(xmit_skb)) {
+				xmit_skb->protocol = eth_hdr(xmit_skb)->h_proto;
+				skb_set_network_header(xmit_skb, ETH_HLEN);
+			} else {
+				xmit_skb->protocol = htons(ETH_P_802_3);
+				skb_reset_network_header(xmit_skb);
+			}
 			dev_queue_xmit(xmit_skb);
 		}
 
-- 
2.53.0

