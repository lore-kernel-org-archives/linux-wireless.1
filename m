Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795441817;
	b=OYGlhUFvBIWPf5/EeVp7p5ltLZCBfXQvdUlY4uNyYF0ozGXXvQwJeijcNehEhtsWyB+A
	 M+nKNa2rhYhx5EPMYA2b6M/thaHMc61Qo+NC7VqbOMhT8z9dXEBOzjs99W3fFrNI0cUXs
	 wuaViOu5It4DMSL4EFkmvJNwusM6+YFlPoAUUyYkk+KqiDI+xbU6budqs+LN/f856Dl/6
	 ZQtpAR69/3ifVfsViU+lR2qBBicViHMYTiN2ScMh17B8VsxtrN2gVPLiWmmqNK/T/MoPr
	 4US0p559aZ2e5q14toqWuoW+8jm7qqkjrQvq6BPCEvEI7Avcrfaxl83YwzctMYMPGPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795441817;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kZAWfOVV6szfbsnxGNpL1TPV/6g7LyK5WV+tYnXzkHs=;
	b=wIgDth05wCwXRgxyZE5TsqbqFmdO4xKNcWmnoiRsol/Lk9rNwt5lcQ+9PqoA3B+OovZh
	 k1C/1EfElgQB2Cgrq4zCS+fBCxpqrflXiE439LjDfnkcV2F0Lrhq7OW13htgKUyAUY2n8
	 ZnrM80v9UI6iBPeK4ebSzE42+T0mHPrD11T458zyckGxpM/3A7od1l1zvCmo61RWm8PLO
	 aWoTE27e28xCP5EWrBGIe21UCfWrhXUMUKtukYugbhQ/Xe7YtmQpYYSJ51oN6yW784LM9
	 O6BRCJMUEz/8eR2KlXVkDCPY94fzpTWhPs0L/Z/rYsMUMCOli2nzsMAJ3AASKzPIg+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=jYy5dE5c;
	arc=none smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86DF8606A69C
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 13:50:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86DF8606A69C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=jYy5dE5c
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b4bd3d98bfso3975549a12.1
        for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 05:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795441815; x=1796046615; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kZAWfOVV6szfbsnxGNpL1TPV/6g7LyK5WV+tYnXzkHs=;
        b=jYy5dE5c6H2ArKW57JjiJwOCfcWMNgubzWQxhtz5O1RzO/ErwM/pFWLXVI1PFP7ddg
         hB99iMBSzV4R/ordubwKf7JQa2cvG0NeDuAXnsjZyQwSxUcJaUabZI2XpfDFRyzHo78p
         7yBOePAhFP0HfVDKkKEJSvnvPURKx05+0VlEiDeeG7OWwPg9pcZQGpm+O6uNN+vzjyJy
         3wWv8Hb11EwFAVygijhZh6qLtAtIs+5KxJsFk8ZLV0Zh969eL9DiBKlTSy1Yoip6HZ4d
         33WCM5eT/NQF0YWGtaFVNDOW0qTvZrekFDPLfiiJJSApwnpm7LTPEXv57HmwN/PQ7SaR
         CYEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795441815; x=1796046615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kZAWfOVV6szfbsnxGNpL1TPV/6g7LyK5WV+tYnXzkHs=;
        b=Wq8YwbuCW2zOp6tgHjOET4DH83u3O6AbbCMFuKeNl4pO+BTCvugtCUEDa71zQP8ATd
         PgjTyy4RgnWYZp31JlsRHNwmPsZq/92adFRQ1yz0LJuzQ4eaD3WvqDueNiPQk/i4vf4+
         tzYjg4Gce2/gDCtFe573rZ2TWpoyqt0Po5UtTrgSsBLJT+fCN6mnGqkJQwOy3XfZEOw1
         cS+mCN3/uN6O0vsjfRRX2/iw95+BWVLJAG8WexK0jCQwJGkLHIV1PiUqXj6mgYdc165Z
         hO4wboPL5o+HkiiGCv1z87jWJTR1hajNibhlCxZXekigdE83UzDPKrfl7QoVYs3xHlqa
         olxA==
X-Forwarded-Encrypted: i=1; AL+hErERnrCJd660UfXgm2vIs0AytIzC38ZykkwWljCWWcXVSsZKLDNsqkYZg2FF2kVx8E40J8U6WlYOEZKqwVeZ2w==@vger.kernel.org
X-Gm-Message-State: APuU4Z+iXYB9oMLeIl4plSHftCGOd+G+TbPb+YyQEhXa8JLjZVK4w1rU
	vPBJwhgvKz0aSUvUcw18N8t0bc5W+EILTHxqkBgUkWUCeIK7JH9O0FgPvjMIZFJhDw==
X-Gm-Gg: AZFdTZeP8vAFVvbhoNjQwOWbKYO4sIe++R0lZw65XVxDvMLSqhEi83QV75cD7r2irIN
	0YzNKtaOOJ3mf+fNbMBG1/bpfDLm/nw2wkz/FDERsaHVO43lOwkhp6aE+Qb/YPJczaV9PlJX0I6
	nkvfcuhEAPnTzkga/RH/IO4ucr0OkceC00X+16gGBGH2ZrfFw4ngTuJeo4FFE/o+JUTBbBFnIvX
	wCUuzCPtmbaKikDLb2erExuZu/vePvqJ5MTuI2cSV4+xgeRVlufgxDdvFSHqUUPPxptl02z6xDf
	ZGVppRuO0lS7XnRaSUQYOcJEOIGJ76p/mQ2drOwZ4K6gqJuEVTF0Re3yXzzlOtPnE1nD/kI7SFz
	TAaEzCIsB8eGKfWvfnC1TtQBoaH98sKzvb+rSA7s5cmYh3lEdnI4tko8pI0+bDVU3HmfTxaRAzS
	S3u/hAzxsaAeFPuupYehUBOovgqYbvrLrS2xINkK0Fotd9JdL/wnZApHtR2Q4BS5+ysEsLQkJu5
	U8+chGtBmmnk4waPmJxsxjaiXVks9pBRsr2f8jCUH5L2hwLnF4pLpI6Q8ltb5wo192ZRftuZs39
	WKJaF8VfOD8mP/PnBNepIPPOnSs2U8Z1v+fEuFnbapKBqkg7xq/M8Bj65+QouhbiX7em6sBi/dQ
	MjMLE8IJVhDfH4JfJB87CwleL4riZUBqfmxq96cKyrYFSMxhNj7pDdqrnwixF1pfXT1BDLinbn6
	iTgfo+b+lbXLsqs2+0zh6f8T2/7fA1VB0pIkDg4XobjdRRldMqD3rh07jjZcgBeFVzefS4ZUsqk
	06+a1qkwaTlVgwA01cEvVEwbqTcc0jdZgzuK6Pcng9psRr/sFzM9M45IKZSLqPyRKmW5iN0X2R6
	lFtFjmqypUdciTSsJLawShg0B8vxmYuSCn9T6VrRwV/GVWBbjWo23gqDCP/3b/zB4BMEFRTkpUD
	vwL/2zYm4J6qet08Mfwg=
X-Received: by 2002:a05:6402:1941:b0:6ba:7bee:e0b0 with SMTP id 4fb4d7f45d1cf-6ba7beee4dfmr4339768a12.8.1795441814619;
        Mon, 23 Nov 2026 05:50:14 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f247012000e9a6b19fb24a0d13.dip0.t-ipconnect.de. [2003:f2:4701:2000:e9a6:b19f:b24a:d13])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fa8a4sm5357732a12.21.2026.11.23.05.50.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:50:14 -0800 (PST)
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
Subject: [RFC PATCH ath-next 3/3] wifi: ath11k: merge the TCP segments of a station in a REO reap
Date: Mon, 23 Nov 2026 14:50:10 +0100
Message-ID: <20261123135010.721107-4-julius@bairaktaris.de>
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

Every MSDU the REO ring hands over goes to mac80211 on its own:
ieee80211_rx_napi() runs the 802.3 receive path for it (the station and
its fast_rx, the station and netdev counters, the control port check,
the internal forward lookup) and passes it to napi_gro_receive(), where
the TCP GRO of the netdev parses it again and merges it into the
aggregate it was building. For a TCP upload of one station at
850 Mbit/s that is about 70,000 frames a second through all of it. In a
profile of such an upload routed by an IPQ8074 (one run), the GRO
functions (dev_gro_receive(), tcp_gro_receive(), inet_gro_receive(),
tcp4_gro_receive() and their helpers) take 7.9 % of all samples and the
mac80211 802.3 receive path 5.2 %.

Merge the consecutive segments of one TCP stream of one station and TID
of a reap in the driver, as GRO on the netdev would merge them, and
hand the run to mac80211 as one GSO frame. A run is opened by a plain
ACK segment, and joined by the next segment of the same stream with the
same receive status, Ethernet header, IP and TCP headers but for the
ID, sequence and checksum; any other frame ends the run before it is
handled itself, so the frames of a stream keep their order and no frame
waits behind another stream's. The run ends at a segment that pushes, a
short one, the GRO size of the netdev and its segment bound, and at the
end of the reap; nothing is held across reaps.

The checks that decide how mac80211 takes a frame stay per MSDU, since
the run is built from MSDUs after ath11k_dp_rx_process_msdu() and
ath11k_dp_rx_h_mpdu(): only a frame that goes the 802.3 path to a
station on its own merges (Ethernet decap, unicast, a peer with a
station, not EAPOL, not of a 4-address station, one buffer, a checksum
the hardware verified, no FCS or MIC error), and the PN and decryption
status every segment had is the one of the run, which is the same for
all of them. Every segment has the Ethernet header of the run, so the
source address mac80211 sees is the one each segment carried. A mesh
interface has no decap offload in ath11k and is not merged. mac80211
counts a GSO frame as its segments.

The form is the one GRO on the netdev the station's frames reach would
build, so nothing after it changes: none with GRO off or an XDP program
there; a frame list when the netdev has rx-gro-list and no socket of
the host takes the stream, as tcp4_check_fraglist_gro() and
tcp6_check_fraglist_gro() decide; else a frame with fragments, whose
segments give their buffer to the head through skb_try_coalesce() and
free their skb. GRO takes a frame list it is handed whole and a TCP GSO
frame as its segment count.

The station of a run is used within the NAPI poll that looked it up,
as ath11k_dp_rx_deliver_msdu() uses the station of its frame. Frames
take the 802.3 path only with Ethernet decap, the frame_mode=2 module
parameter; with the native Wi-Fi default nothing is merged.

Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/core.h    |   3 +
 drivers/net/wireless/ath/ath11k/debugfs.c |   4 +
 drivers/net/wireless/ath/ath11k/dp_rx.c   | 444 +++++++++++++++++++++-
 3 files changed, 450 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index 6b05b2e4d926..d1fdc0593d38 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -903,6 +903,9 @@ struct ath11k_soc_dp_stats {
 	u32 rxdma_error[HAL_REO_ENTR_RING_RXDMA_ECODE_MAX];
 	u32 reo_error[HAL_REO_DEST_RING_ERROR_CODE_MAX];
 	u32 hal_reo_error[DP_REO_DST_RING_MAX];
+	/* runs of received TCP segments merged into one frame, their segments */
+	u32 rx_merge_aggs;
+	u32 rx_merge_segs;
 	struct ath11k_soc_dp_tx_err_stats tx_err;
 	struct ath11k_dp_ring_bp_stats bp_stats;
 };
diff --git a/drivers/net/wireless/ath/ath11k/debugfs.c b/drivers/net/wireless/ath/ath11k/debugfs.c
index b936101d6fa5..870e00ec7569 100644
--- a/drivers/net/wireless/ath/ath11k/debugfs.c
+++ b/drivers/net/wireless/ath/ath11k/debugfs.c
@@ -705,6 +705,10 @@ static ssize_t ath11k_debugfs_dump_soc_dp_stats(struct file *file,
 			 soc_stats->hal_reo_error[2],
 			 soc_stats->hal_reo_error[3]);
 
+	len += scnprintf(buf + len, size - len,
+			 "\nReceived TCP runs merged into one frame: %u, their segments: %u\n",
+			 soc_stats->rx_merge_aggs, soc_stats->rx_merge_segs);
+
 	len += scnprintf(buf + len, size - len, "\nSOC TX STATS:\n");
 	len += scnprintf(buf + len, size - len, "\nTCL Ring Full Failures:\n");
 
diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index a85edaf19bfb..062281dfbae6 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -10,6 +10,8 @@
 #include <linux/kernel.h>
 #include <linux/net.h>
 #include <linux/skbuff.h>
+#include <net/inet6_hashtables.h>
+#include <net/inet_hashtables.h>
 #include <net/page_pool/helpers.h>
 #include "core.h"
 #include "debug.h"
@@ -2854,8 +2856,9 @@ static void ath11k_dp_rx_deliver_msdu(struct ath11k *ar, struct napi_struct *nap
 		   !!(status->flag & RX_FLAG_MMIC_ERROR),
 		   !!(status->flag & RX_FLAG_AMSDU_MORE));
 
+	/* a merged frame has only its first segment's bytes in its head */
 	ath11k_dbg_dump(ar->ab, ATH11K_DBG_DP_RX, NULL, "dp rx msdu: ",
-			msdu->data, msdu->len);
+			msdu->data, skb_headlen(msdu));
 
 	rx_status = IEEE80211_SKB_RXCB(msdu);
 	*rx_status = *status;
@@ -2987,6 +2990,439 @@ static int ath11k_dp_rx_process_msdu(struct ath11k *ar,
 	return ret;
 }
 
+/* The headers of a TCP segment in an Ethernet frame. */
+struct ath11k_dp_rx_tcp {
+	struct ethhdr *eth;
+	union {
+		struct iphdr *ip4;
+		struct ipv6hdr *ip6;
+	};
+	struct tcphdr *th;
+	u16 hdr_len;
+	u16 payload;
+	bool v6;
+};
+
+/*
+ * A run of consecutive segments of one TCP stream of one station, merged
+ * into the first one's skb as its fragments, or chained on its frag_list
+ * with their headers when @flist, and what the next segment has to be to
+ * join it: @status is the receive status every segment of it had, and a
+ * segment that does not join ends the run before it is handled itself.
+ */
+struct ath11k_dp_rx_merge {
+	struct sk_buff *head;
+	struct sk_buff *last;
+	struct ieee80211_rx_status status;
+	struct ath11k_dp_rx_tcp t;
+	u32 next_seq;
+	u32 max_size;
+	u16 last_id;
+	u16 mss;
+	u16 segs;
+	u16 max_segs;
+	bool fixedid;
+	bool flist;
+};
+
+/*
+ * Whether @msdu takes the 802.3 path of ath11k_dp_rx_deliver_msdu() to a
+ * station of its own, on its own: a unicast frame of the Ethernet decap type,
+ * of a peer whose station ath11k_dp_rx_h_mpdu() found, not EAPOL, not of a
+ * 4-address station, in one buffer.
+ */
+static bool ath11k_dp_rx_merge_ok(struct ath11k *ar, struct sk_buff *msdu)
+{
+	struct ath11k_skb_rxcb *rxcb = ATH11K_SKB_RXCB(msdu);
+
+	if (!rxcb->sta_valid || !rxcb->sta || rxcb->is_mcbc ||
+	    rxcb->is_eapol || rxcb->is_frag || rxcb->is_continuation)
+		return false;
+
+	if (ath11k_dp_rx_h_msdu_start_decap_type(ar->ab, rxcb->rx_desc) !=
+	    DP_RX_DECAP_TYPE_ETHERNET2_DIX)
+		return false;
+
+	return !READ_ONCE(ath11k_sta_to_arsta(rxcb->sta)->use_4addr_set);
+}
+
+/*
+ * The headers of @msdu when it is a TCP data segment of an IPv4 or IPv6
+ * frame that carries nothing a merge would lose: one buffer, a checksum the
+ * hardware verified, no VLAN tag, IP options, extension headers or fragment,
+ * a length that is the frame's, a unicast destination, and the flags of a
+ * plain acknowledgment that may push.
+ */
+static bool ath11k_dp_rx_merge_parse(struct sk_buff *msdu,
+				     struct ath11k_dp_rx_tcp *t)
+{
+	unsigned int len = msdu->len, thoff, thlen;
+	u8 *d = msdu->data;
+	struct tcphdr *th;
+
+	if (skb_is_nonlinear(msdu) || msdu->ip_summed != CHECKSUM_UNNECESSARY ||
+	    len < ETH_HLEN + sizeof(struct iphdr) + sizeof(*th))
+		return false;
+
+	t->eth = (struct ethhdr *)d;
+	if (is_multicast_ether_addr(t->eth->h_dest))
+		return false;
+
+	if (t->eth->h_proto == htons(ETH_P_IP)) {
+		struct iphdr *iph = (struct iphdr *)(d + ETH_HLEN);
+
+		if (*(u8 *)iph != 0x45 || iph->protocol != IPPROTO_TCP ||
+		    (iph->frag_off & htons(IP_MF | IP_OFFSET)) ||
+		    ETH_HLEN + ntohs(iph->tot_len) != len)
+			return false;
+		t->ip4 = iph;
+		t->v6 = false;
+		thoff = ETH_HLEN + sizeof(*iph);
+	} else if (t->eth->h_proto == htons(ETH_P_IPV6)) {
+		struct ipv6hdr *ip6h = (struct ipv6hdr *)(d + ETH_HLEN);
+
+		if (len < ETH_HLEN + sizeof(*ip6h) + sizeof(*th) ||
+		    ip6h->version != 6 || ip6h->nexthdr != IPPROTO_TCP ||
+		    ETH_HLEN + sizeof(*ip6h) + ntohs(ip6h->payload_len) != len)
+			return false;
+		t->ip6 = ip6h;
+		t->v6 = true;
+		thoff = ETH_HLEN + sizeof(*ip6h);
+	} else {
+		return false;
+	}
+
+	th = (struct tcphdr *)(d + thoff);
+	thlen = th->doff * 4;
+	if (thlen < sizeof(*th) || thoff + thlen >= len)
+		return false;
+
+	if (!th->ack || th->fin || th->syn || th->rst || th->urg ||
+	    th->ece || th->cwr || th->urg_ptr)
+		return false;
+
+	t->th = th;
+	t->hdr_len = thoff + thlen;
+	t->payload = len - t->hdr_len;
+
+	return true;
+}
+
+/*
+ * Whether segment @t of @msdu, received with @status, follows the run's last
+ * one as GRO on the netdev would take it: the same station, TID and receive
+ * status, the same Ethernet header, IP header but for the ID, ports,
+ * acknowledgment, window and options, the next sequence number, an IP ID
+ * that goes up by one or stays with DF set, and room under the size GRO
+ * stops at. A frame list takes no segment that pushes, as GRO's does not.
+ */
+static bool ath11k_dp_rx_merge_fits(const struct ath11k_dp_rx_merge *g,
+				    struct sk_buff *msdu,
+				    const struct ieee80211_rx_status *status,
+				    const struct ath11k_dp_rx_tcp *t,
+				    bool *fixed)
+{
+	const struct ath11k_skb_rxcb *rxcb = ATH11K_SKB_RXCB(msdu);
+	const struct ath11k_skb_rxcb *hcb = ATH11K_SKB_RXCB(g->head);
+	const struct ath11k_dp_rx_tcp *h = &g->t;
+	unsigned int optlen;
+
+	if (g->flist && t->th->psh)
+		return false;
+
+	if (rxcb->sta != hcb->sta || rxcb->tid != hcb->tid ||
+	    memcmp(status, &g->status, sizeof(*status)))
+		return false;
+
+	if (t->v6 != h->v6 || t->hdr_len != h->hdr_len ||
+	    t->payload > g->mss || ntohl(t->th->seq) != g->next_seq ||
+	    g->head->len + t->payload >= g->max_size ||
+	    memcmp(t->eth, h->eth, ETH_HLEN) ||
+	    memcmp(&t->th->source, &h->th->source, sizeof(__be32)) ||
+	    t->th->ack_seq != h->th->ack_seq || t->th->window != h->th->window)
+		return false;
+
+	optlen = t->hdr_len - ((u8 *)t->th - (u8 *)t->eth) - sizeof(*t->th);
+	if (memcmp(t->th + 1, h->th + 1, optlen))
+		return false;
+
+	if (t->v6)
+		return *(__be32 *)t->ip6 == *(__be32 *)h->ip6 &&
+		       t->ip6->hop_limit == h->ip6->hop_limit &&
+		       !memcmp(&t->ip6->saddr, &h->ip6->saddr,
+			       2 * sizeof(t->ip6->saddr));
+
+	if (t->ip4->tos != h->ip4->tos || t->ip4->ttl != h->ip4->ttl ||
+	    t->ip4->frag_off != h->ip4->frag_off ||
+	    memcmp(&t->ip4->saddr, &h->ip4->saddr, 2 * sizeof(__be32)))
+		return false;
+
+	if (g->segs > 1)
+		*fixed = g->fixedid;
+	else
+		*fixed = ntohs(t->ip4->id) == g->last_id;
+	if (*fixed)
+		return !!(t->ip4->frag_off & htons(IP_DF));
+
+	return ntohs(t->ip4->id) == (u16)(g->last_id + 1);
+}
+
+/*
+ * Gives the run what the TCP GRO of the stack gives its own aggregate: the
+ * length of the IP packet, and the size and number of its segments; for
+ * one with fragments the pseudo-header sum its checksum is finished from by
+ * whoever segments it, while a frame list keeps the checksum of each segment,
+ * which the hardware verified.
+ */
+static void ath11k_dp_rx_merge_complete(struct ath11k_dp_rx_merge *g)
+{
+	struct sk_buff *skb = g->head;
+	struct ath11k_dp_rx_tcp *t = &g->t;
+	struct skb_shared_info *shinfo = skb_shinfo(skb);
+	unsigned int thoff = (u8 *)t->th - skb->data;
+	unsigned int l4len = skb->len - thoff;
+
+	if (t->v6) {
+		t->ip6->payload_len = htons(skb->len - ETH_HLEN -
+					    sizeof(*t->ip6));
+		shinfo->gso_type = SKB_GSO_TCPV6;
+	} else {
+		__be16 len = htons(skb->len - ETH_HLEN);
+
+		csum_replace2(&t->ip4->check, t->ip4->tot_len, len);
+		t->ip4->tot_len = len;
+		shinfo->gso_type = SKB_GSO_TCPV4;
+	}
+
+	skb_set_network_header(skb, ETH_HLEN);
+	skb_set_transport_header(skb, thoff);
+	shinfo->gso_size = g->mss;
+	shinfo->gso_segs = g->segs;
+
+	if (g->flist) {
+		shinfo->gso_type |= SKB_GSO_FRAGLIST;
+		skb->ip_summed = CHECKSUM_UNNECESSARY;
+		skb->csum_level = 0;
+		return;
+	}
+
+	if (t->v6) {
+		t->th->check = ~csum_ipv6_magic(&t->ip6->saddr, &t->ip6->daddr,
+						l4len, IPPROTO_TCP, 0);
+	} else {
+		t->th->check = ~csum_tcpudp_magic(t->ip4->saddr, t->ip4->daddr,
+						  l4len, IPPROTO_TCP, 0);
+		if (g->fixedid)
+			shinfo->gso_type |= SKB_GSO_TCP_FIXEDID;
+	}
+	skb->csum_start = (u8 *)t->th - skb->head;
+	skb->csum_offset = offsetof(struct tcphdr, check);
+	skb->ip_summed = CHECKSUM_PARTIAL;
+}
+
+/*
+ * Hands the run to mac80211 as one frame with the receive status of its
+ * segments; one of several segments as a GSO frame, which mac80211 counts
+ * as those segments.
+ */
+static void ath11k_dp_rx_merge_flush(struct ath11k *ar,
+				     struct napi_struct *napi,
+				     struct ath11k_dp_rx_merge *g)
+{
+	struct sk_buff *skb = g->head;
+
+	if (!skb)
+		return;
+
+	/* complete before the run is let go: it reads g->head */
+	if (g->segs > 1) {
+		ath11k_dp_rx_merge_complete(g);
+		ar->ab->soc_stats.rx_merge_aggs++;
+		ar->ab->soc_stats.rx_merge_segs += g->segs;
+	}
+	g->head = NULL;
+
+	ath11k_dp_rx_deliver_msdu(ar, napi, skb, &g->status);
+}
+
+/*
+ * Appends segment @t of @msdu to the run: its payload as a fragment of the
+ * head, which takes the buffer it was received in and frees the segment's
+ * skb, or the segment whole to the frame list. A segment that cannot be taken
+ * is left as it was.
+ */
+static bool ath11k_dp_rx_merge_join(struct ath11k *ar,
+				    struct napi_struct *napi,
+				    struct ath11k_dp_rx_merge *g,
+				    struct sk_buff *msdu,
+				    const struct ath11k_dp_rx_tcp *t, bool fixed)
+{
+	u16 payload = t->payload, id = t->v6 ? 0 : ntohs(t->ip4->id);
+	u16 hdr_len = t->hdr_len;
+	bool push = t->th->psh, fragstolen;
+	int delta;
+
+	if (g->flist) {
+		/*
+		 * Chained as skb_gro_receive_list() chains a segment: its
+		 * headers stay in front of its payload, where the network
+		 * header names them for whoever cuts the list.
+		 */
+		skb_set_network_header(msdu, ETH_HLEN);
+		skb_set_transport_header(msdu, (u8 *)t->th - msdu->data);
+		__skb_pull(msdu, hdr_len);
+		if (g->last == g->head)
+			skb_shinfo(g->head)->frag_list = msdu;
+		else
+			g->last->next = msdu;
+		msdu->next = NULL;
+		g->last = msdu;
+		g->head->data_len += msdu->len;
+		g->head->len += msdu->len;
+		g->head->truesize += msdu->truesize;
+	} else {
+		__skb_pull(msdu, hdr_len);
+		if (!skb_try_coalesce(g->head, msdu, &fragstolen, &delta)) {
+			__skb_push(msdu, hdr_len);
+			return false;
+		}
+		kfree_skb_partial(msdu, fragstolen);
+	}
+
+	if (g->segs == 1)
+		g->fixedid = fixed;
+	g->segs++;
+	g->next_seq += payload;
+	g->last_id = id;
+	if (push)
+		g->t.th->psh = 1;
+
+	/*
+	 * A segment that ends a write ends the run, as does a short one, and
+	 * the bound on its size.
+	 */
+	if (push || payload < g->mss || g->segs >= g->max_segs)
+		ath11k_dp_rx_merge_flush(ar, napi, g);
+
+	return true;
+}
+
+/*
+ * Starts a run with @msdu, unless GRO on the netdev its frames reach is off
+ * or has an XDP program there, which see every frame alone. The run takes the
+ * form GRO on the netdev would give it: with frame lists on a frame list,
+ * unless a socket of the host takes the stream, as tcp4_check_fraglist_gro()
+ * and tcp6_check_fraglist_gro() decide, else a frame with fragments; either up
+ * to the netdev's GRO size.
+ */
+static bool ath11k_dp_rx_merge_open(struct ath11k_dp_rx_merge *g,
+				    struct sk_buff *msdu,
+				    const struct ieee80211_rx_status *status,
+				    const struct ath11k_dp_rx_tcp *t)
+{
+	struct ieee80211_sta *sta = ATH11K_SKB_RXCB(msdu)->sta;
+	struct net_device *dev;
+	struct sock *sk = NULL;
+	int iif, sdif = 0;
+	bool flist;
+
+	rcu_read_lock();
+	dev = ieee80211_sta_rx_netdev(sta);
+	if (!dev || netif_elide_gro(dev)) {
+		rcu_read_unlock();
+		return false;
+	}
+
+	g->max_size = min_t(u32, t->v6 ? READ_ONCE(dev->gro_max_size) :
+				  READ_ONCE(dev->gro_ipv4_max_size),
+			    GRO_LEGACY_MAX_SIZE);
+	flist = dev->features & NETIF_F_GRO_FRAGLIST;
+	if (flist) {
+		iif = dev->ifindex;
+#if IS_ENABLED(CONFIG_NET_L3_MASTER_DEV)
+		if (netif_is_l3_slave(dev)) {
+			struct net_device *master;
+
+			master = netdev_master_upper_dev_get_rcu(dev);
+			sdif = iif;
+			iif = master ? master->ifindex : 0;
+		}
+#endif
+		if (!t->v6)
+			sk = __inet_lookup_established(dev_net_rcu(dev),
+						       t->ip4->saddr,
+						       t->th->source,
+						       t->ip4->daddr,
+						       ntohs(t->th->dest),
+						       iif, sdif);
+#if IS_ENABLED(CONFIG_IPV6)
+		else
+			sk = __inet6_lookup_established(dev_net_rcu(dev),
+							&t->ip6->saddr,
+							t->th->source,
+							&t->ip6->daddr,
+							ntohs(t->th->dest),
+							iif, sdif);
+#endif
+	}
+	rcu_read_unlock();
+
+	if (sk) {
+		sock_gen_put(sk);
+		flist = false;
+	}
+
+	g->head = msdu;
+	g->last = msdu;
+	g->flist = flist;
+	memcpy(&g->status, status, sizeof(*status));
+	g->t = *t;
+	g->mss = t->payload;
+	g->next_seq = ntohl(t->th->seq) + t->payload;
+	g->last_id = t->v6 ? 0 : ntohs(t->ip4->id);
+	g->segs = 1;
+	g->fixedid = false;
+	/*
+	 * GRO ends a frame list at 64 segments, and a frame with fragments
+	 * takes one per segment but the first.
+	 */
+	g->max_segs = flist ? 64 : MAX_SKB_FRAGS + 1;
+
+	return true;
+}
+
+/*
+ * A frame ath11k_dp_rx_process_msdu() has made ready for mac80211, with its
+ * receive status @status: merged into the run when it is the next segment of
+ * it, else the run is sent and the frame starts one, or is left to be sent
+ * alone. The frames of a stream leave in the order they came in, and a frame
+ * never waits behind another one's: a frame that does not join ends the run
+ * before it is handled.
+ *
+ * Return: true when the frame is the run's.
+ */
+static bool ath11k_dp_rx_merge_rx(struct ath11k *ar, struct napi_struct *napi,
+				  struct ath11k_dp_rx_merge *g,
+				  struct sk_buff *msdu,
+				  const struct ieee80211_rx_status *status)
+{
+	struct ath11k_dp_rx_tcp t;
+	bool fixed = false, ok;
+
+	ok = !(status->flag & (RX_FLAG_FAILED_FCS_CRC | RX_FLAG_MMIC_ERROR)) &&
+	     ath11k_dp_rx_merge_ok(ar, msdu) &&
+	     ath11k_dp_rx_merge_parse(msdu, &t);
+
+	if (g->head) {
+		if (ok && ath11k_dp_rx_merge_fits(g, msdu, status, &t, &fixed) &&
+		    ath11k_dp_rx_merge_join(ar, napi, g, msdu, &t, fixed))
+			return true;
+		ath11k_dp_rx_merge_flush(ar, napi, g);
+	}
+
+	return ok && !t.th->psh && ath11k_dp_rx_merge_open(g, msdu, status, &t);
+}
+
 static void ath11k_dp_rx_process_received_packets(struct ath11k_base *ab,
 						  struct napi_struct *napi,
 						  struct sk_buff_head *msdu_list,
@@ -2995,6 +3431,7 @@ static void ath11k_dp_rx_process_received_packets(struct ath11k_base *ab,
 	struct sk_buff *msdu;
 	struct ath11k *ar;
 	struct ieee80211_rx_status rx_status = {};
+	struct ath11k_dp_rx_merge merge = {};
 	int ret;
 
 	if (skb_queue_empty(msdu_list))
@@ -3020,8 +3457,13 @@ static void ath11k_dp_rx_process_received_packets(struct ath11k_base *ab,
 			continue;
 		}
 
+		if (ath11k_dp_rx_merge_rx(ar, napi, &merge, msdu, &rx_status))
+			continue;
+
 		ath11k_dp_rx_deliver_msdu(ar, napi, msdu, &rx_status);
 	}
+
+	ath11k_dp_rx_merge_flush(ar, napi, &merge);
 }
 
 /*
-- 
2.53.0

