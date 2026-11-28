Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795881820;
	b=ji/M2/6uUfY1b00l/tOKPv4mwM3P8M7faGPrZV1jZbhF41GRGM9Zqiv2T7UHHJ4U0WLR
	 9ly4tUE27+PpayOoZPreCvG7PGFeYK+D2c4fZn/jGyPjsxx6dNtEj8EIynW4PsyZM2gM1
	 pSM4fq5GH81WUrsQFq4vhgq4xgEGAW7uQ5P2En9t91kNRUtKgmsbgmu4NHHUbYjgo7sSi
	 9JO7Ne8IhVWJnWpC/Fu9UukK2XiysA0P5s5oMC91SQL3lzq/a7QEZLi2D6430CWjGPCjw
	 hGEFnTGm+dqSt4uZwPiAvlpv9e7Ztw0R6xfbzII7NQGWONyy1drRZj3WEn43Snpjlqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795881820;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=868a/UVmwsNaRJvxrCK8lfineTN1iwqIJ4228Iylmqk=;
	b=R3Q2t5wnh4m4oq4EhIOt+4/1CfBuaFo/rjNziZ54My7NdTigAsrzQ2E3hXraudpSX77L
	 i3G0Obfh7wsDu/35HxWaJlMjMbg02kEg4wz+GzNGBrTuuohf90WAvmB8HoQGZW95HuJXJ
	 OAzLwD2wMFbdcAhgjOjlEY0SZiOZRhyWg4DjXkUO++1jkaaqLp94Qofn/oSMeOlEbjjaW
	 oVJfJMLl2ZID6i29J4XyhSy/ugIwXkOW802BVKInxfDm+gxL7adoW1w1/rWlfr94Zluj5
	 TzXNuLcPkJpZ84ifXiGMXZ5z3GNlNgPwiiQtaVUdPqyWHQetK99n8giP8GW7m6HCk+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=oGWUPouh;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F21660A260C
	for <linux-wireless@vger.kernel.org>; Sat, 28 Nov 2026 16:03:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F21660A260C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=oGWUPouh
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c516a194350so430353566b.3
        for <linux-wireless@vger.kernel.org>; Sat, 28 Nov 2026 08:03:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795881818; x=1796486618; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=868a/UVmwsNaRJvxrCK8lfineTN1iwqIJ4228Iylmqk=;
        b=oGWUPouhJy/5YFVTzJeFZ05KU4Fi/XR8EXucS8twOsFUJeLltXS0/cqFUUYFV7yTK2
         r9uKWN4Xd6eZC4HV7l41qRe2jenzBaoVnY/1OZdnXDf7it5LkEsRvLLmpLOPG7t5F8/L
         1434E6DMkQnnCjDkhyGFZK0ohI8J0Gowpq8+SkzQFJb7jvrSth0VyOOPr3RrLYMeOFAp
         IpMh7wFteeqz/CaNn2Ybh0qHPIkVTufCmwLYV0jpR8thVST2pNn2aME3gTsTB0oZB/e0
         eekjD6kT6DFM4OM5IC9o/RZD3fOWOQ2mlkufTWFZEvBF8zGmNIbRcailTZMrhUSh3s3q
         v65Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795881818; x=1796486618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=868a/UVmwsNaRJvxrCK8lfineTN1iwqIJ4228Iylmqk=;
        b=Jf2QhDsTGlzMdqBP8l5M7rBivWeMwcZPMaM+v/hvySw3e/jhlfL0v/Len/+P593h/r
         eLmHdtVCviTR+2wA3srQKwjZw0PHATecxptAHT0lojDzZiU7W++BSkiL/LaCCKpa+CHx
         4+ITedfzPJTIncF74x9Nypf+2yrBkRPwonKSuzPHAxD3T5/lkAcOTYioLeCV3HUMpKKT
         VIyCVu139gN6U52Yd3/rPeNc05ImxnYlaKsjxAvDUqyoL8iStn5csg8Yz3BNvPW+ATmC
         YgAKL6ed7aMtu8hKSwZ0FpKCF4ylVyBJKigCXuJXRJPL3vevWmV0831Dj6gGlw3v1MRx
         YLAQ==
X-Gm-Message-State: APuU4Z8kZQ4zmGkU969q8j12dH1SWYSJwHy7f+70pblAj/30puQfA+Hc
	iBqczHhd2F9gsYn7Pe45CDr4iMvDY99RsMwWOOiQNysjHoDKXCkAa0Prz6KqRBJQCg==
X-Gm-Gg: AZFdTZf3Ag0H2alyYEFX8tLqY9v9APW3gkFAAoQ7Wl76xwZs1InDqE9jr0YEoew/31c
	oOZYeLM1mm6FWORvNettGOjtRxPb9L6JB7JOqKmlEbeAd4Fo4ujARQlseCSPl55cVIIo38l46xZ
	XckiLM4fGmCvZNIh1cBNG79YuNU2rAacSfM24zthFo3DBrHssmWlVlAgp3qt5WYUWvW2tWSF66C
	asPLu6Wh78xSVrPYyZy+HUz6nqtEQYbbWPhWgvbaCAX7/rug2YoE5F8Aq1uUzjDj9r1xjFHFsJR
	cXLPkaoEgrCowu4xItwY4rG3r81m85ZovQdAtSJKHSuebyj22U3RGp2m/QY+Bz/w7Q49OPZohsm
	nQshDd5Wn5it5Qt3EXkwu6TUmLuLhOhkEfIxrjAt/7xahHhAc3GG9kVfcyFdP30L+DbIw28NRkJ
	amjkQMa+ZatzPcQEF/6c+BoZI8kIQ2t3vOw9MrB9Tp6y1+fkxkypaNqvFypd56jYSZwGqT7qz7n
	rJbgAMtxFebX1bpPmuM9EVZwnJ37NumJefJUVSzSNI4EeJvAGXUAifx9aSBzgBaE4RVZh4TXoyQ
	6t0ODqtzdEK4LOEIuwhTA6qaDMkRl1MQyWmw/rqMHYSHcna/cGjzPfvZoc5FrdpMPNdHbzut8GP
	8RqqkYq7aFNZuoBgLz/luacy2KARfkY58sWhCdnSZuTOaSlFKrW+4qbCCgnxwcA9+dHX2g+bPTb
	hJnzfBe7CVtLR4Nc4MAMAdGjtiyxQMFoaaK4nzXguHcLT1lKErVy28YOUnOTx1a4K8bgfLw0K7v
	i+i8nzgF32lVtn2v50yVP3s7pBGrvxdR42UKqZAezljSGOEKhm5jaTxXJN5Nrf1FEiwJXgomf8K
	zYpEkL+qMfWqlA==
X-Received: by 2002:a17:906:5d9:b0:c41:4964:90b6 with SMTP id a640c23a62f3a-c513aab025emr1766181066b.36.1795881817868;
        Sat, 28 Nov 2026 08:03:37 -0800 (PST)
Received: from Desktop.tail070c67.ts.net ([185.152.145.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b022e84sm990389566b.84.2026.11.28.08.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 08:03:37 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	Jeff Johnson <jjohnson@kernel.org>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Felix Fietkau <nbd@nbd.name>,
	=?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
	=?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless-next v2 6/7] wifi: ath11k: pass the TID of a received 802.3 frame to mac80211
Date: Sat, 28 Nov 2026 17:03:34 +0100
Message-ID: <20261128160335.1815537-7-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261128160335.1815537-1-julius@bairaktaris.de>
References: <20261128160335.1815537-1-julius@bairaktaris.de>
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

ath11k_dp_rx_deliver_msdu() delivers frames with Ethernet decap as
RX_FLAG_8023, and mac80211 counted all of them on TID 0. Pass the TID
the driver keeps in rxcb->tid. Copying the rx status into skb->cb
overwrites rxcb, so read it before that.

On the REO path rxcb->tid is the REO queue number, which is
HAL_DESC_REO_NON_QOS_TID for a frame without QoS control. The null
queue descriptor path takes it from the 4-bit TID field of MPDU_START;
set HAL_DESC_REO_NON_QOS_TID there as well when the MPDU has no QoS
control, so mac80211 counts such a frame as non-QoS on both paths.

Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
v2:
- Read rxcb->tid before *rx_status = *status overwrites it. Found by
  the hosted Sashiko review of v1.
- Report a frame without QoS control on the null queue descriptor path
  as HAL_DESC_REO_NON_QOS_TID. Found by an LLM review (Claude).

 drivers/net/wireless/ath/ath11k/dp_rx.c | 14 +++++++++++++-
 drivers/net/wireless/ath/ath11k/hw.c    | 25 +++++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/hw.h    |  1 +
 3 files changed, 39 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 6d95f7b343a5..6d09b4c10b6d 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -70,6 +70,12 @@ static inline bool ath11k_dp_rx_h_mpdu_start_fc_valid(struct ath11k_base *ab,
 	return ab->hw_params.hw_ops->rx_desc_get_mpdu_fc_valid(desc);
 }
 
+static inline bool ath11k_dp_rx_h_mpdu_start_qos_ctrl_valid(struct ath11k_base *ab,
+							    struct hal_rx_desc *desc)
+{
+	return ab->hw_params.hw_ops->rx_desc_get_mpdu_qos_ctrl_valid(desc);
+}
+
 static inline bool ath11k_dp_rx_h_mpdu_start_more_frags(struct ath11k_base *ab,
 							struct sk_buff *skb)
 {
@@ -2446,6 +2452,7 @@ static void ath11k_dp_rx_deliver_msdu(struct ath11k *ar, struct napi_struct *nap
 	u8 decap = DP_RX_DECAP_TYPE_RAW;
 	bool is_mcbc = rxcb->is_mcbc;
 	bool is_eapol = rxcb->is_eapol;
+	u8 tid = rxcb->tid;
 
 	if (status->encoding == RX_ENC_HE &&
 	    !(status->flag & RX_FLAG_RADIOTAP_HE) &&
@@ -2493,6 +2500,7 @@ static void ath11k_dp_rx_deliver_msdu(struct ath11k *ar, struct napi_struct *nap
 
 	rx_status = IEEE80211_SKB_RXCB(msdu);
 	*rx_status = *status;
+	rx_status->tid = min_t(u8, tid, IEEE80211_NUM_TIDS);
 
 	/* TODO: trace rx packet */
 
@@ -4001,7 +4009,11 @@ static int ath11k_dp_rx_h_null_q_desc(struct ath11k *ar, struct sk_buff *msdu,
 
 	ath11k_dp_rx_h_mpdu(ar, msdu, desc, status);
 
-	rxcb->tid = ath11k_dp_rx_h_mpdu_start_tid(ar->ab, desc);
+	/* the REO queue number, as on the REO path */
+	if (ath11k_dp_rx_h_mpdu_start_qos_ctrl_valid(ar->ab, desc))
+		rxcb->tid = ath11k_dp_rx_h_mpdu_start_tid(ar->ab, desc);
+	else
+		rxcb->tid = HAL_DESC_REO_NON_QOS_TID;
 
 	/* Please note that caller will having the access to msdu and completing
 	 * rx with mac80211. Need not worry about cleaning up amsdu_list.
diff --git a/drivers/net/wireless/ath/ath11k/hw.c b/drivers/net/wireless/ath/ath11k/hw.c
index 93f9a03c48dc..20d0cd9687bc 100644
--- a/drivers/net/wireless/ath/ath11k/hw.c
+++ b/drivers/net/wireless/ath/ath11k/hw.c
@@ -296,6 +296,12 @@ static bool ath11k_hw_ipq8074_rx_desc_get_mpdu_fc_valid(struct hal_rx_desc *desc
 			   __le32_to_cpu(desc->u.ipq8074.mpdu_start.info1));
 }
 
+static bool ath11k_hw_ipq8074_rx_desc_get_mpdu_qos_ctrl_valid(struct hal_rx_desc *desc)
+{
+	return !!FIELD_GET(RX_MPDU_START_INFO1_MPDU_QOS_CTRL_VALID,
+			   __le32_to_cpu(desc->u.ipq8074.mpdu_start.info1));
+}
+
 static u16 ath11k_hw_ipq8074_rx_desc_get_mpdu_start_seq_no(struct hal_rx_desc *desc)
 {
 	return FIELD_GET(RX_MPDU_START_INFO1_MPDU_SEQ_NUM,
@@ -473,6 +479,12 @@ static bool ath11k_hw_qcn9074_rx_desc_get_mpdu_fc_valid(struct hal_rx_desc *desc
 			   __le32_to_cpu(desc->u.qcn9074.mpdu_start.info11));
 }
 
+static bool ath11k_hw_qcn9074_rx_desc_get_mpdu_qos_ctrl_valid(struct hal_rx_desc *desc)
+{
+	return !!FIELD_GET(RX_MPDU_START_INFO11_MPDU_QOS_CTRL_VALID,
+			   __le32_to_cpu(desc->u.qcn9074.mpdu_start.info11));
+}
+
 static u16 ath11k_hw_qcn9074_rx_desc_get_mpdu_start_seq_no(struct hal_rx_desc *desc)
 {
 	return FIELD_GET(RX_MPDU_START_INFO11_MPDU_SEQ_NUM,
@@ -644,6 +656,12 @@ static bool ath11k_hw_wcn6855_rx_desc_get_mpdu_fc_valid(struct hal_rx_desc *desc
 			   __le32_to_cpu(desc->u.wcn6855.mpdu_start.info1));
 }
 
+static bool ath11k_hw_wcn6855_rx_desc_get_mpdu_qos_ctrl_valid(struct hal_rx_desc *desc)
+{
+	return !!FIELD_GET(RX_MPDU_START_INFO1_MPDU_QOS_CTRL_VALID,
+			   __le32_to_cpu(desc->u.wcn6855.mpdu_start.info1));
+}
+
 static u16 ath11k_hw_wcn6855_rx_desc_get_mpdu_start_seq_no(struct hal_rx_desc *desc)
 {
 	return FIELD_GET(RX_MPDU_START_INFO1_MPDU_SEQ_NUM,
@@ -917,6 +935,7 @@ const struct ath11k_hw_ops ipq8074_ops = {
 	.rx_desc_get_ldpc_support = ath11k_hw_ipq8074_rx_desc_get_ldpc_support,
 	.rx_desc_get_mpdu_seq_ctl_vld = ath11k_hw_ipq8074_rx_desc_get_mpdu_seq_ctl_vld,
 	.rx_desc_get_mpdu_fc_valid = ath11k_hw_ipq8074_rx_desc_get_mpdu_fc_valid,
+	.rx_desc_get_mpdu_qos_ctrl_valid = ath11k_hw_ipq8074_rx_desc_get_mpdu_qos_ctrl_valid,
 	.rx_desc_get_mpdu_start_seq_no = ath11k_hw_ipq8074_rx_desc_get_mpdu_start_seq_no,
 	.rx_desc_get_msdu_len = ath11k_hw_ipq8074_rx_desc_get_msdu_len,
 	.rx_desc_get_msdu_sgi = ath11k_hw_ipq8074_rx_desc_get_msdu_sgi,
@@ -957,6 +976,7 @@ const struct ath11k_hw_ops ipq6018_ops = {
 	.rx_desc_get_ldpc_support = ath11k_hw_ipq8074_rx_desc_get_ldpc_support,
 	.rx_desc_get_mpdu_seq_ctl_vld = ath11k_hw_ipq8074_rx_desc_get_mpdu_seq_ctl_vld,
 	.rx_desc_get_mpdu_fc_valid = ath11k_hw_ipq8074_rx_desc_get_mpdu_fc_valid,
+	.rx_desc_get_mpdu_qos_ctrl_valid = ath11k_hw_ipq8074_rx_desc_get_mpdu_qos_ctrl_valid,
 	.rx_desc_get_mpdu_start_seq_no = ath11k_hw_ipq8074_rx_desc_get_mpdu_start_seq_no,
 	.rx_desc_get_msdu_len = ath11k_hw_ipq8074_rx_desc_get_msdu_len,
 	.rx_desc_get_msdu_sgi = ath11k_hw_ipq8074_rx_desc_get_msdu_sgi,
@@ -997,6 +1017,7 @@ const struct ath11k_hw_ops qca6390_ops = {
 	.rx_desc_get_ldpc_support = ath11k_hw_ipq8074_rx_desc_get_ldpc_support,
 	.rx_desc_get_mpdu_seq_ctl_vld = ath11k_hw_ipq8074_rx_desc_get_mpdu_seq_ctl_vld,
 	.rx_desc_get_mpdu_fc_valid = ath11k_hw_ipq8074_rx_desc_get_mpdu_fc_valid,
+	.rx_desc_get_mpdu_qos_ctrl_valid = ath11k_hw_ipq8074_rx_desc_get_mpdu_qos_ctrl_valid,
 	.rx_desc_get_mpdu_start_seq_no = ath11k_hw_ipq8074_rx_desc_get_mpdu_start_seq_no,
 	.rx_desc_get_msdu_len = ath11k_hw_ipq8074_rx_desc_get_msdu_len,
 	.rx_desc_get_msdu_sgi = ath11k_hw_ipq8074_rx_desc_get_msdu_sgi,
@@ -1037,6 +1058,7 @@ const struct ath11k_hw_ops qcn9074_ops = {
 	.rx_desc_get_ldpc_support = ath11k_hw_qcn9074_rx_desc_get_ldpc_support,
 	.rx_desc_get_mpdu_seq_ctl_vld = ath11k_hw_qcn9074_rx_desc_get_mpdu_seq_ctl_vld,
 	.rx_desc_get_mpdu_fc_valid = ath11k_hw_qcn9074_rx_desc_get_mpdu_fc_valid,
+	.rx_desc_get_mpdu_qos_ctrl_valid = ath11k_hw_qcn9074_rx_desc_get_mpdu_qos_ctrl_valid,
 	.rx_desc_get_mpdu_start_seq_no = ath11k_hw_qcn9074_rx_desc_get_mpdu_start_seq_no,
 	.rx_desc_get_msdu_len = ath11k_hw_qcn9074_rx_desc_get_msdu_len,
 	.rx_desc_get_msdu_sgi = ath11k_hw_qcn9074_rx_desc_get_msdu_sgi,
@@ -1077,6 +1099,7 @@ const struct ath11k_hw_ops wcn6855_ops = {
 	.rx_desc_get_ldpc_support = ath11k_hw_wcn6855_rx_desc_get_ldpc_support,
 	.rx_desc_get_mpdu_seq_ctl_vld = ath11k_hw_wcn6855_rx_desc_get_mpdu_seq_ctl_vld,
 	.rx_desc_get_mpdu_fc_valid = ath11k_hw_wcn6855_rx_desc_get_mpdu_fc_valid,
+	.rx_desc_get_mpdu_qos_ctrl_valid = ath11k_hw_wcn6855_rx_desc_get_mpdu_qos_ctrl_valid,
 	.rx_desc_get_mpdu_start_seq_no = ath11k_hw_wcn6855_rx_desc_get_mpdu_start_seq_no,
 	.rx_desc_get_msdu_len = ath11k_hw_wcn6855_rx_desc_get_msdu_len,
 	.rx_desc_get_msdu_sgi = ath11k_hw_wcn6855_rx_desc_get_msdu_sgi,
@@ -1117,6 +1140,7 @@ const struct ath11k_hw_ops wcn6750_ops = {
 	.rx_desc_get_ldpc_support = ath11k_hw_qcn9074_rx_desc_get_ldpc_support,
 	.rx_desc_get_mpdu_seq_ctl_vld = ath11k_hw_qcn9074_rx_desc_get_mpdu_seq_ctl_vld,
 	.rx_desc_get_mpdu_fc_valid = ath11k_hw_qcn9074_rx_desc_get_mpdu_fc_valid,
+	.rx_desc_get_mpdu_qos_ctrl_valid = ath11k_hw_qcn9074_rx_desc_get_mpdu_qos_ctrl_valid,
 	.rx_desc_get_mpdu_start_seq_no = ath11k_hw_qcn9074_rx_desc_get_mpdu_start_seq_no,
 	.rx_desc_get_msdu_len = ath11k_hw_qcn9074_rx_desc_get_msdu_len,
 	.rx_desc_get_msdu_sgi = ath11k_hw_qcn9074_rx_desc_get_msdu_sgi,
@@ -1158,6 +1182,7 @@ const struct ath11k_hw_ops ipq5018_ops = {
 	.rx_desc_get_ldpc_support = ath11k_hw_qcn9074_rx_desc_get_ldpc_support,
 	.rx_desc_get_mpdu_seq_ctl_vld = ath11k_hw_qcn9074_rx_desc_get_mpdu_seq_ctl_vld,
 	.rx_desc_get_mpdu_fc_valid = ath11k_hw_qcn9074_rx_desc_get_mpdu_fc_valid,
+	.rx_desc_get_mpdu_qos_ctrl_valid = ath11k_hw_qcn9074_rx_desc_get_mpdu_qos_ctrl_valid,
 	.rx_desc_get_mpdu_start_seq_no = ath11k_hw_qcn9074_rx_desc_get_mpdu_start_seq_no,
 	.rx_desc_get_msdu_len = ath11k_hw_qcn9074_rx_desc_get_msdu_len,
 	.rx_desc_get_msdu_sgi = ath11k_hw_qcn9074_rx_desc_get_msdu_sgi,
diff --git a/drivers/net/wireless/ath/ath11k/hw.h b/drivers/net/wireless/ath/ath11k/hw.h
index 4996536fbd14..3bd99d347fba 100644
--- a/drivers/net/wireless/ath/ath11k/hw.h
+++ b/drivers/net/wireless/ath/ath11k/hw.h
@@ -252,6 +252,7 @@ struct ath11k_hw_ops {
 	bool (*rx_desc_get_ldpc_support)(struct hal_rx_desc *desc);
 	bool (*rx_desc_get_mpdu_seq_ctl_vld)(struct hal_rx_desc *desc);
 	bool (*rx_desc_get_mpdu_fc_valid)(struct hal_rx_desc *desc);
+	bool (*rx_desc_get_mpdu_qos_ctrl_valid)(struct hal_rx_desc *desc);
 	u16 (*rx_desc_get_mpdu_start_seq_no)(struct hal_rx_desc *desc);
 	u16 (*rx_desc_get_msdu_len)(struct hal_rx_desc *desc);
 	u8 (*rx_desc_get_msdu_sgi)(struct hal_rx_desc *desc);
-- 
2.53.0

