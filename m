Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795441303;
	b=JMPi6oI/OB8GpsFZBHeaUcfrv6jICBtX/+0DkYI/viG4vxm80jBsYLUJlHP17I/qjIz+
	 UgoGOxQZagXPzujEbR9jjWR9kDNErq1aItXONjGXYTz6oRWzspI5s/dS4hQlqBbeMYdiZ
	 Sh50y8qTDcWa5fm7ueabnta2kBacQk0Cd/gVc5QPJYNrfhDeVdGRBauZGo6TdsUy91l9Q
	 YpoGEwO/4IVGwWHx8i71ISrpNMq5VpldGKiY3M5EuxL65VxZGkrcTUCg+ur5SYpkvEauE
	 R65p1A+eZ7GZBHDxM5NtX37BguDv2tFcl42dkwDnF+aYFr7ippFn7yLAVBR1FTuinsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795441303;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yi15kur2YRezGqgqZjCpyNcgXCQsHgDB/ZB6iiC1/2A=;
	b=eF7FvwZCdkgoRv9hdHlgXHQTzirXV7isJeFwM+cVl5H0SwVxfIlYIJNwa2b/grajp09u
	 +21kGcY9Y9OIca1x0lJsOhzeK0DhG3zKS/bHzTmL3pM4iEYxFtRLf8suOq2g1wpRDXYRZ
	 dldbOiM5pFIQicvNjGSgACFUlGndOpLIvRNGqUx1kWLwAJ41PcFpIta3QhWPTjRa6Fjio
	 T7WFwwHQNtUHUNE3p+kBmVAgJsBkmyU/13cFW7XbXQMSK9c+G2jAs0h0lJ7CRsk+TJ5TO
	 kch3nM7sMmwogy5e7Ky6MvUQJQ+YC36aJJfDRVFiAh6+KhZJSpR6oDnJKCb4d4AcK6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b="DNjTmQ/a";
	arc=none smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B71E60A6F53
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 13:41:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B71E60A6F53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=DNjTmQ/a
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b587538a37so4836028a12.2
        for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 05:41:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795441301; x=1796046101; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yi15kur2YRezGqgqZjCpyNcgXCQsHgDB/ZB6iiC1/2A=;
        b=DNjTmQ/a8MuPKprfsLx2iIvDFl4j2T4ws1JsE/argz2ZlpIJEiR16WZb0NIyzrieYr
         0HLntxaXo2Saf6pqmybpf/abg12CUAbWtchGT8Tq2YOT/JoE4LG19t0dcFAHROcv/Pbl
         OE3RxzF8A/eyOEPZSt7P6Qig+DZuDeuCiTYzbvUa/lgc2OlO2799gs76hiViZYbbEkw7
         SUfAfYDXBppKjArRJKf9SMYObREYkHINa3ica7Iw1NhI6d5O24RqRHrXJiQhdSKt+PA6
         qvAFnfFUMobKTGs5xadU2fXSh3Gd9wzORhJCWn53PSyce6poWJLMYp05g2DbhOf9KQpY
         H8Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795441301; x=1796046101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yi15kur2YRezGqgqZjCpyNcgXCQsHgDB/ZB6iiC1/2A=;
        b=QU4RtZPAKwG1yIhN6h6QAQqTFtBUdv/cC5rhOjHsbhiZYWUnE1G3llki5W4+e3XiHQ
         JQtTM2WArjxOlSB9O9/S9KUtv8caRiMuomS1ftZypBuDK/hl42XgGP4iwUJJZso1UX0r
         e1lawMs1o/pPESafIOvadaZ3ZP5e6aNdjVQ3wDfP4kuuyltz6zV2dErSq092AkXb9eOX
         0twfRiRXqlf3bjj7S3ro7hD8A0Xev3LW+LOJiymgiaUnDYUVkagomqKPyry4HmMZSahG
         LWJy6mdNp3BcpxUgeMBRzyLHJ6cj9CApwJmGpQ5lX9EMjVOunx4BMwq38cZvp3YGF6Hr
         T0Rg==
X-Forwarded-Encrypted: i=1; AL+hErELf+rQweQolVBqoAX2/MeAN70wGNwjDf1pBb/8ujUZOU7J6Y5+PgDjlgEpriiRy3CBi8zCNFSjLMbNjvxpLA==@vger.kernel.org
X-Gm-Message-State: APuU4Z943SiDqSAHTeCja8Kc3uyEg5rSlvM3YRp0NE3OzIsRbWorS/vJ
	2lBpPWJHBCz1wSz4VW+pFB015ytdliLvP2HyDgmPGyauUy49hQmxXsbG7aHRXPAHmQ==
X-Gm-Gg: AZFdTZeJ9TVRMeRIWNXNMyhqFYzj9tqtKLjCjSee+AdkA8ByGKABv4q0MRZMNr1dLnD
	RZ7VsHeReDAi/EJhcLMBI2LS7V2wPqG9sLksRKPnM5o2bzx2gUJBY3ro+adjVFnnHzu/2PhKIRj
	LZqNP6L5hoU0tjNhQF2AyM6RiyqfSHjQw8Z5/7fXpOsWYj3M8p4qUoFlL88l21IO2QDSVvzROeQ
	NwojR7m0m+uxVRGWyNqYxJXnC4K6eVsiJbJ4p1fnZg73uyTPVB+r0HHcHRp5PzHY9UhiRcZdQ8w
	+/7QRcUfFUIyQx4WWvLRSFpjre5izy81TJTc+qtz8Pytoht5JBFQD3Vk/7LmB5s7JuIRddQNW10
	ot33K4A0dAf/WSrO/LgYBeDxbu9lcjKexdqiKzHDWGfr7UtN5DgF8kmzveOQlNdvzo6fWq+HlEd
	Uhape6X/ynH6WM9r3rXcJrC4HY8vcVIvKOTn1CoRSZirVH24EsGoWhhtkNxOorvoIx1jX2gIGY0
	fbbzAQYMIpwDBreBIll6vXNhKM4S05zTI1WsafZIXFtjVUSXsdCL964XNGFfQJg8pDyr9UKx8W7
	TDDXU1dmbar670DCLTT79H0iDWWTNBF10uEF++PCro/k56yjE1XeA3Y891zxS9wri6IAd8oT54Y
	O1TN8K2WNR/lBHcgwPvwNpV87eYtjpNJtQf8FiuQaVzQT6ypA6vXhgrIST4qzwmNDh0E6W++kjL
	4mTWssKKAC7OVR/g1L076jdLIwelyoeyz2AJ2z0SA2PUW361IIUgJa1m5/Ee7PxGVrgqG3AYRx5
	e/+tgemmietTg88sHc3tK/wLAZq6EXNwUpuM/lo9PoNXBv8dUMmFo07uKbRA7gW9oqwMputu0km
	HQII0MeYizPXHgXqZOLzu3Y3llj/4fqDHgZFmGApojSd1yGHelNlfKPmQMln45bJEy3tGUZG9g=
	=
X-Received: by 2002:a05:6402:5cd:b0:6ba:4be1:9698 with SMTP id 4fb4d7f45d1cf-6ba4be1a024mr6759019a12.7.1795441301254;
        Mon, 23 Nov 2026 05:41:41 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f247012000e9a6b19fb24a0d13.dip0.t-ipconnect.de. [2003:f2:4701:2000:e9a6:b19f:b24a:d13])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fbf0esm5339576a12.23.2026.11.23.05.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:41:40 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	Praneesh P <praneesh.p@oss.qualcomm.com>,
	Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
	Mark Ruvald Pedersen <wabsie@gmail.com>,
	Rosen Penev <rosenp@gmail.com>
Subject: [PATCH ath-next v1 03/10] wifi: ath11k: request only the PPDU stats TLVs it reads
Date: Mon, 23 Nov 2026 14:41:30 +0100
Message-ID: <20261123134137.718575-4-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261123134137.718575-1-julius@bairaktaris.de>
References: <20261123134137.718575-1-julius@bairaktaris.de>
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

The driver asks the firmware for eight PPDU stats TLVs on every PPDU, but
ath11k_htt_tlv_ppdu_stats_parse() keeps four of them: the common TLV (PPDU
airtime), the user rate TLV (rate, NSS and bandwidth of each user, which
the station rate and the airtime accounting use), the user completion
common TLV (MPDUs tried and succeeded) and the ack/BA status TLV (acked
bytes and MSDUs, TID). The user common, scheduler command status, flush
and user array TLVs are parsed by nothing, yet the firmware builds them
and the host walks them for every PPDU of every station.

Request the four the driver reads. The full pktlog, the extended TX
statistics and the monitor interface keep the default set and the lite
pktlog its own set, as before, so the mask is recomputed when any of them
is switched on or off.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/debugfs.c | 15 ++++++++--
 drivers/net/wireless/ath/ath11k/debugfs.h | 10 +++++++
 drivers/net/wireless/ath/ath11k/dp.h      |  9 ++++++
 drivers/net/wireless/ath/ath11k/dp_tx.c   | 34 +++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/dp_tx.h   |  1 +
 drivers/net/wireless/ath/ath11k/mac.c     | 13 +++++++--
 6 files changed, 77 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/debugfs.c b/drivers/net/wireless/ath/ath11k/debugfs.c
index 70922612d3fb..b936101d6fa5 100644
--- a/drivers/net/wireless/ath/ath11k/debugfs.c
+++ b/drivers/net/wireless/ath/ath11k/debugfs.c
@@ -460,7 +460,9 @@ static ssize_t ath11k_write_enable_extd_tx_stats(struct file *file,
 	}
 
 	ar->debug.extd_tx_stats = filter;
-	ret = count;
+	ret = ath11k_dp_tx_htt_ppdu_stats_update(ar);
+	if (!ret)
+		ret = count;
 
 out:
 	mutex_unlock(&ar->conf_mutex);
@@ -1010,6 +1012,13 @@ static ssize_t ath11k_write_pktlog_filter(struct file *file,
 			HTT_RX_FILTER_TLV_FLAGS_MPDU_START)
 
 	if (mode == ATH11K_PKTLOG_MODE_FULL) {
+		ret = ath11k_dp_tx_htt_h2t_ppdu_stats_req(ar,
+							  HTT_PPDU_STATS_TAG_DEFAULT);
+		if (ret) {
+			ath11k_err(ar->ab, "failed to enable pktlog full: %d\n", ret);
+			goto out;
+		}
+
 		rx_filter = HTT_RX_FILTER_TLV_LITE_MODE |
 			    HTT_RX_FILTER_TLV_FLAGS_MSDU_START |
 			    HTT_RX_FILTER_TLV_FLAGS_MSDU_END |
@@ -1032,8 +1041,8 @@ static ssize_t ath11k_write_pktlog_filter(struct file *file,
 		tlv_filter = ath11k_mac_mon_status_filter_default;
 		rx_filter = tlv_filter.rx_filter;
 
-		ret = ath11k_dp_tx_htt_h2t_ppdu_stats_req(ar,
-							  HTT_PPDU_STATS_TAG_DEFAULT);
+		ar->debug.pktlog_mode = mode;
+		ret = ath11k_dp_tx_htt_ppdu_stats_update(ar);
 		if (ret) {
 			ath11k_err(ar->ab, "failed to send htt ppdu stats req: %d\n",
 				   ret);
diff --git a/drivers/net/wireless/ath/ath11k/debugfs.h b/drivers/net/wireless/ath/ath11k/debugfs.h
index 859071938a65..4bec01a85eae 100644
--- a/drivers/net/wireless/ath/ath11k/debugfs.h
+++ b/drivers/net/wireless/ath/ath11k/debugfs.h
@@ -279,6 +279,11 @@ static inline bool ath11k_debugfs_is_pktlog_lite_mode_enabled(struct ath11k *ar)
 	return (ar->debug.pktlog_mode == ATH11K_PKTLOG_MODE_LITE);
 }
 
+static inline bool ath11k_debugfs_is_pktlog_enabled(struct ath11k *ar)
+{
+	return ar->debug.pktlog_mode;
+}
+
 static inline bool ath11k_debugfs_is_pktlog_rx_stats_enabled(struct ath11k *ar)
 {
 	return (!ar->debug.pktlog_peer_valid && ar->debug.pktlog_mode);
@@ -364,6 +369,11 @@ static inline bool ath11k_debugfs_is_pktlog_lite_mode_enabled(struct ath11k *ar)
 	return false;
 }
 
+static inline bool ath11k_debugfs_is_pktlog_enabled(struct ath11k *ar)
+{
+	return false;
+}
+
 static inline bool ath11k_debugfs_is_pktlog_rx_stats_enabled(struct ath11k *ar)
 {
 	return false;
diff --git a/drivers/net/wireless/ath/ath11k/dp.h b/drivers/net/wireless/ath/ath11k/dp.h
index e6e05eb25692..5e973c337cb2 100644
--- a/drivers/net/wireless/ath/ath11k/dp.h
+++ b/drivers/net/wireless/ath/ath11k/dp.h
@@ -595,6 +595,15 @@ enum htt_ppdu_stats_tag_type {
 				   | BIT(HTT_PPDU_STATS_TAG_USR_COMPLTN_FLUSH) \
 				   | BIT(HTT_PPDU_STATS_TAG_USR_COMMON_ARRAY))
 
+/*
+ * The TLVs ath11k_htt_tlv_ppdu_stats_parse() keeps: the PPDU airtime, the
+ * rate of each user, the retry counts and the acked bytes.
+ */
+#define HTT_PPDU_STATS_TAG_USED (BIT(HTT_PPDU_STATS_TAG_COMMON) \
+				| BIT(HTT_PPDU_STATS_TAG_USR_RATE) \
+				| BIT(HTT_PPDU_STATS_TAG_USR_COMPLTN_COMMON) \
+				| BIT(HTT_PPDU_STATS_TAG_USR_COMPLTN_ACK_BA_STATUS))
+
 #define HTT_PPDU_STATS_TAG_PKTLOG  (BIT(HTT_PPDU_STATS_TAG_USR_MPDU_ENQ_BITMAP_64) | \
 				    BIT(HTT_PPDU_STATS_TAG_USR_MPDU_ENQ_BITMAP_256) | \
 				    BIT(HTT_PPDU_STATS_TAG_USR_COMPLTN_BA_BITMAP_64) | \
diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c b/drivers/net/wireless/ath/ath11k/dp_tx.c
index cac970c92806..9e21c7c3dba2 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
@@ -1033,6 +1033,40 @@ int ath11k_dp_tx_htt_h2t_ver_req_msg(struct ath11k_base *ab)
 	return 0;
 }
 
+/*
+ * The TLVs the driver does not parse (user common, scheduler command status,
+ * flush, user array) go only to pktlog and the trace point. The pktlog lite
+ * mode asks for its own set, and the full pktlog, the monitor and the
+ * extended statistics debugfs file keep the whole default set.
+ */
+static u32 ath11k_dp_tx_htt_ppdu_stats_mask(struct ath11k *ar)
+{
+	if (ath11k_debugfs_is_pktlog_lite_mode_enabled(ar))
+		return HTT_PPDU_STATS_TAG_PKTLOG;
+
+	if (ath11k_debugfs_is_extd_tx_stats_enabled(ar) ||
+	    ath11k_debugfs_is_pktlog_enabled(ar) ||
+	    test_bit(ATH11K_FLAG_MONITOR_STARTED, &ar->monitor_flags))
+		return HTT_PPDU_STATS_TAG_DEFAULT;
+
+	return HTT_PPDU_STATS_TAG_USED;
+}
+
+/**
+ * ath11k_dp_tx_htt_ppdu_stats_update() - request the PPDU stats TLVs in use
+ * @ar: the radio, whose conf_mutex the caller holds
+ *
+ * Asks the firmware for the PPDU stats TLVs that the driver and the enabled
+ * debug features read, and only those.
+ *
+ * Return: 0 on success, or the error of the HTT request.
+ */
+int ath11k_dp_tx_htt_ppdu_stats_update(struct ath11k *ar)
+{
+	return ath11k_dp_tx_htt_h2t_ppdu_stats_req(ar,
+						   ath11k_dp_tx_htt_ppdu_stats_mask(ar));
+}
+
 int ath11k_dp_tx_htt_h2t_ppdu_stats_req(struct ath11k *ar, u32 mask)
 {
 	struct ath11k_base *ab = ar->ab;
diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.h b/drivers/net/wireless/ath/ath11k/dp_tx.h
index 9303b5ba6e01..934c9ab6acf5 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.h
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.h
@@ -29,6 +29,7 @@ int ath11k_dp_tx_send_reo_cmd(struct ath11k_base *ab, struct dp_rx_tid *rx_tid,
 					   enum hal_reo_cmd_status));
 
 int ath11k_dp_tx_htt_h2t_ppdu_stats_req(struct ath11k *ar, u32 mask);
+int ath11k_dp_tx_htt_ppdu_stats_update(struct ath11k *ar);
 int
 ath11k_dp_tx_htt_h2t_ext_stats_req(struct ath11k *ar, u8 type,
 				   struct htt_ext_stats_cfg_params *cfg_params,
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 1a237adaa37d..79d5cf88f3b7 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -1195,6 +1195,11 @@ static int ath11k_mac_monitor_start(struct ath11k *ar)
 		return ret;
 	}
 
+	ret = ath11k_dp_tx_htt_ppdu_stats_update(ar);
+	if (ret)
+		ath11k_warn(ar->ab, "failed to req ppdu stats for monitor: %d\n",
+			    ret);
+
 	ath11k_dbg(ar->ab, ATH11K_DBG_MAC, "monitor started\n");
 
 	return 0;
@@ -1225,6 +1230,11 @@ static int ath11k_mac_monitor_stop(struct ath11k *ar)
 		return ret;
 	}
 
+	ret = ath11k_dp_tx_htt_ppdu_stats_update(ar);
+	if (ret)
+		ath11k_warn(ar->ab, "failed to req ppdu stats for monitor: %d\n",
+			    ret);
+
 	ath11k_dbg(ar->ab, ATH11K_DBG_MAC, "monitor stopped ret %d\n", ret);
 
 	return 0;
@@ -6694,8 +6704,7 @@ static int ath11k_mac_op_start(struct ieee80211_hw *hw)
 		goto err;
 	}
 
-	ret = ath11k_dp_tx_htt_h2t_ppdu_stats_req(ar,
-						  HTT_PPDU_STATS_TAG_DEFAULT);
+	ret = ath11k_dp_tx_htt_ppdu_stats_update(ar);
 	if (ret) {
 		ath11k_err(ab, "failed to req ppdu stats: %d\n", ret);
 		goto err;
-- 
2.53.0

