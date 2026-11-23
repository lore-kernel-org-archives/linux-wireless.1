Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795441304;
	b=d3fDAi5nm4YSf7o7+v3h0kGrsWnNWUDyRDyAkyQVkYZbeflLi7PTPuLTFDIadYIef9+8
	 Sd44yPopUlDddxM8o94FjvhECbz233GYVyWQU7LcNeMtP6aEUnAbZLzosoXOyo1RbMljF
	 8nxTDFXwaI9zq0LEDNz77BRyjRCe6hMLoh8jMp7cOom25ZJbmQsNhoeMdLMJUZU1LYRGj
	 Tb8MnBgZhezDAwJk6Kzr5M6n6sHxSS0kjnL8TJBrBlazE+ED8n9ZqsRitoknf3c6lGCwE
	 3BmzU6GTCxr0ehGE0NV5PVJ7rd1WTkSF06I+mEHrydhCSePTpcScI/4veU9rVhq6y3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795441304;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yu7J9cI4J6eMRXfImtI0cKipkxIOsOHsH3WCb0gS3hM=;
	b=kn6onL7mkrRO18n7KzdCbsfy3M3Sb4xgz8wGmPrF9v9N6VAgX1UCFr7e+wVlMYFdP3Oo
	 61tMym9VfOErufVpGYuGdDCH/P0FsWAHK1z48gnuzY3HI6OwOZPWjJhiyUJ+e0x7ArNDZ
	 n04eScLZ1LwL7fg/mgeEcbS8dlA/4kQIdju7JUhXFQevRafDxq8mupKO2u3gAbrJzAqpm
	 99q7piXQMJC9h7ls4MWVPEMRWucce00cjiut3yPqGlNgZJpGBdjM2xUZIsmlSJgDkrgJx
	 9zfMfzwO8JRPqCnMpIyNkJb/2VGmcP62abSE9eswSVptDDxro4tMrPcT2pPt2adO7BA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b="kH/m7MGX";
	arc=none smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A31160A6F7D
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 13:41:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A31160A6F7D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=kH/m7MGX
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6ae305e3bd9so5543328a12.0
        for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 05:41:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795441303; x=1796046103; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yu7J9cI4J6eMRXfImtI0cKipkxIOsOHsH3WCb0gS3hM=;
        b=kH/m7MGXhr3gRUnew3v7bGg5U/zXeENcjhopfGx1/JgCCQVEArVqeg44cyQUW7/Nqb
         3kYLVDzAYvte+d7At+J1Ma0l+iRZdkt88HmBzencoCnM7HzVwgDixBRw1CaVjr4IAb+g
         Ei4KIHj1noHRBdnkA/XqMUkzIcSKeZLCpQgyF7ieXmTgpnKfLBRV73aOa+14OKtuwlpm
         dDn1lTWWKSfZfQWNQosqealkQHNT2eGxs+7g37GbeggOvRWRhQ2En6EWPEl8jrBc08Fx
         EALm+k1Hv39V8Kw4QcFWK0jBjc0nOEV13bgSW+UvDQbKglzPRACGdfoMVbwNUhrxPBog
         Mlqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795441303; x=1796046103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yu7J9cI4J6eMRXfImtI0cKipkxIOsOHsH3WCb0gS3hM=;
        b=UpMHK2jz00dTMI0BGTqJJ+W7XHUXZ0Tty4REbGDrDVvSTfTe57YIbh2b3SdFHZfZfH
         YR1xhmFXq4b3bbtgdm4wa2jqVTWWyLIc6ZWOLhZhz/+SFvb7+3tKLRAuVGrpy/SE/sbH
         EhvUDaX/JxFZV+EwcVQ2JE4UnTCxPAKCMtidrMzwefSL81XBIrRikj0BszK1JnqcDpzK
         imdnHkL7kZ/FfshU8CAbksViqGx0k3AF3xGgg1DAj/o20wccJ2BHDuyUkdoxn1w2hvwr
         cPRLG/j6AJhX99I3i/XHjW4IAnpdi/HPvp2bMIglsFwq/RJRIuoZ0SMMN4s5BfgwMtb2
         cDgA==
X-Forwarded-Encrypted: i=1; AL+hErHPZMIWXISgezX60ioOSfXnT/6nztNNVncY/e+6hAVEaDliBy3NusG7mz67X2QIMpIqd/K0KgqgBZdtVtUURg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/x254mAurDuoz+E/+yf7yE3t5BfdAPZpUlA/cNILErA3r3qXgN
	ja3E9Y2Q7kMUoE4/0deaaJWVgJIkMV6W5kVwV5+zr33SM+ozQmTfk7uwHefUvKLVbA==
X-Gm-Gg: AZFdTZeYA5utTywwtjBe7MV7ut3fb5Jz0Xy4X7ohTxpjK8oFiQ/5RPb7h4fEncns1Tn
	1IfsCWYhdO5v80NPupKD3pnbVf0RaD2jjlU39Qz+NMYYTc9c1EybD33NOGMZH4pgOkbqxXCijv9
	aw79Qnh6PdMnm3vozS6ZUYnb3rlsw73GNLnjfg0ZZd7opMVu3FzEPbDI8LVP5O+jZSwAKG5tsX9
	8mZP53VUmdv/zbSn5+DAafsj5Ewf+mlI85YsoaigatLhO92FclWcythXqBK+ys1N2q64gwOgOUA
	eoA7h6aRu1J0A12MwVuAKWvRmVBXBu+PHBGwAUU7U+K5Gqbrp49X1RJxanaUgjZX2R3wC9V2HSQ
	5IDjLzI/KPEPADIdOqQXVE44I7YTpkImQ0i0eq/Pl6pF8WmfYOWRZe4aUk5mmOZOfZlyVGCCai9
	lYyAABI3ifTPS++DuKMudjxk8gFMxxm8Xe3gyjZ0YX3LNxdf0Lz26DgQiQ5djj9KSVHLI0iipPK
	KWJK/xM886i5YTJ9If3/6KrM0+nnL72RyphxohOCpg+PcEuJVWdDL5rjByDMiEpC1nw9ztFbZjp
	0qJzXf4kgwjEsvprhdvXK5CYFD6b/eptqWLWBoHyGjOVcgembGTfQ5WWytOCq/1dPhOGNz3k7CK
	n6ZBazwiCbWIsWGNas7m4KIc6AkMSJN2BUhsXzyRaTiuHgVW3hGTv9Zd6T9q9I4aIyUujbL2F2r
	pfxfj+3fZGvexqtiZdsqOcCEfzLfou2+a8Gm+OzbjWWVge+qV+GYloKXp9sM5owS1KI5xRj3hCI
	/RfdPsrlShmnQCsMjs5rz8FDWefMUZiti8S/fVVTEeezEoLFcuDsw09LHbBIIU+amYwYjMJxBw7
	9mNVvLoPcpB0AiQ8ypm/Ed5FB8dm0uKELVVFXipoOyElC11B5Gzp+b+kdqR6QKzILBcejA+Dog=
	=
X-Received: by 2002:a05:6402:1f4d:b0:6ba:3f4e:79d8 with SMTP id 4fb4d7f45d1cf-6ba3f4e7a62mr7747627a12.36.1795441302373;
        Mon, 23 Nov 2026 05:41:42 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f247012000e9a6b19fb24a0d13.dip0.t-ipconnect.de. [2003:f2:4701:2000:e9a6:b19f:b24a:d13])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fbf0esm5339576a12.23.2026.11.23.05.41.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:41:41 -0800 (PST)
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
Subject: [PATCH ath-next v1 04/10] wifi: ath11k: set the skb hash of a received frame from the hardware
Date: Mon, 23 Nov 2026 14:41:31 +0100
Message-ID: <20261123134137.718575-5-julius@bairaktaris.de>
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

mac80211 picks the TXQ flow of a frame by skb_get_hash() in
fq_flow_idx(), and RPS and the queueing disciplines on the output device
do the same. ath11k never sets the hash, so every received frame that is
forwarded or steered is dissected again, though the receive engine has
already hashed its 5-tuple (flow_id_toeplitz in the MSDU start TLV, with
the seed ath11k_wmi_pdev_lro_cfg() sets at random).

Use that hash as an L4 hash for a frame whose descriptor says it is TCP
or UDP, not an IP fragment, and with the fixed IP header and the TCP/UDP
header parsed. A zero hash is not used. A boot random value is mixed into
it, so that it is not a function of the packet alone and a station
cannot choose the flow queue that a flow of another station shares.

The field is at the same place in the MSDU start TLV of every chip
family; read it, and the word with the flags, through two new hw_ops.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 36 +++++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/hw.c    | 22 +++++++++++++++
 drivers/net/wireless/ath/ath11k/hw.h    |  1 +
 3 files changed, 59 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index b3b8afb82a78..b027b76ea3f3 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -6,7 +6,9 @@
 
 #include <linux/fips.h>
 #include <linux/ieee80211.h>
+#include <linux/jhash.h>
 #include <linux/kernel.h>
+#include <linux/net.h>
 #include <linux/skbuff.h>
 #include <net/page_pool/helpers.h>
 #include "core.h"
@@ -2057,6 +2059,39 @@ static void ath11k_dp_rx_h_csum_offload(struct ath11k *ar, struct sk_buff *msdu)
 	msdu->ip_summed = CHECKSUM_UNNECESSARY;
 }
 
+static u32 ath11k_rx_hash_seed __read_mostly;
+
+/*
+ * The receive engine hashes the 5-tuple of a TCP or UDP frame whose IP and L4
+ * headers it parsed. mac80211's queue selection and the queueing disciplines
+ * would otherwise dissect the frame again for the same hash.
+ */
+static void ath11k_dp_rx_h_hash(struct ath11k *ar, struct sk_buff *msdu)
+{
+	const struct ath11k_hw_ops *ops = ar->ab->hw_params.hw_ops;
+	struct ath11k_skb_rxcb *rxcb = ATH11K_SKB_RXCB(msdu);
+	u32 info2, hash;
+
+	info2 = ops->rx_desc_get_msdu_start_info2(rxcb->rx_desc);
+	if (!(info2 & (RX_MSDU_START_INFO2_TCP | RX_MSDU_START_INFO2_UDP)) ||
+	    (info2 & RX_MSDU_START_INFO2_IP_FRAG) ||
+	    !(info2 & RX_MSDU_START_INFO2_IP_FIXED_HDR_VALID) ||
+	    !(info2 & RX_MSDU_START_INFO2_IP_TCP_UDP_HDR_VALID))
+		return;
+
+	hash = ops->rx_desc_get_flow_id_toeplitz(rxcb->rx_desc);
+	if (!hash)
+		return;
+
+	/*
+	 * Make the hash differ per boot, so that a station cannot aim
+	 * collisions at the queues of the others.
+	 */
+	net_get_random_once(&ath11k_rx_hash_seed, sizeof(ath11k_rx_hash_seed));
+	skb_set_hash(msdu, jhash_1word(hash, ath11k_rx_hash_seed),
+		     PKT_HASH_TYPE_L4);
+}
+
 int ath11k_dp_rx_crypto_mic_len(struct ath11k *ar, enum hal_encrypt_type enctype)
 {
 	switch (enctype) {
@@ -2524,6 +2559,7 @@ static int ath11k_dp_rx_h_mpdu(struct ath11k *ar,
 	}
 
 	ath11k_dp_rx_h_csum_offload(ar, msdu);
+	ath11k_dp_rx_h_hash(ar, msdu);
 	ath11k_dp_rx_h_undecap(ar, msdu, rx_desc,
 			       enctype, rx_status, is_decrypted);
 
diff --git a/drivers/net/wireless/ath/ath11k/hw.c b/drivers/net/wireless/ath/ath11k/hw.c
index 096366b85849..40a9fae52e84 100644
--- a/drivers/net/wireless/ath/ath11k/hw.c
+++ b/drivers/net/wireless/ath/ath11k/hw.c
@@ -283,6 +283,11 @@ static u8 ath11k_hw_ipq8074_rx_desc_get_mesh_ctl(struct hal_rx_desc *desc)
 			 __le32_to_cpu(desc->u.ipq8074.msdu_start.info2));
 }
 
+static u32 ath11k_hw_ipq8074_rx_desc_get_flow_id_toeplitz(struct hal_rx_desc *desc)
+{
+	return __le32_to_cpu(desc->u.ipq8074.msdu_start.flow_id_toeplitz);
+}
+
 static bool ath11k_hw_ipq8074_rx_desc_get_ldpc_support(struct hal_rx_desc *desc)
 {
 	return FIELD_GET(RX_MSDU_START_INFO2_LDPC,
@@ -465,6 +470,11 @@ static u8 ath11k_hw_qcn9074_rx_desc_get_mesh_ctl(struct hal_rx_desc *desc)
 			 __le32_to_cpu(desc->u.qcn9074.msdu_start.info2));
 }
 
+static u32 ath11k_hw_qcn9074_rx_desc_get_flow_id_toeplitz(struct hal_rx_desc *desc)
+{
+	return __le32_to_cpu(desc->u.qcn9074.msdu_start.flow_id_toeplitz);
+}
+
 static bool ath11k_hw_qcn9074_rx_desc_get_ldpc_support(struct hal_rx_desc *desc)
 {
 	return FIELD_GET(RX_MSDU_START_INFO2_LDPC,
@@ -647,6 +657,11 @@ static u8 ath11k_hw_wcn6855_rx_desc_get_mesh_ctl(struct hal_rx_desc *desc)
 			 __le32_to_cpu(desc->u.wcn6855.msdu_start.info2));
 }
 
+static u32 ath11k_hw_wcn6855_rx_desc_get_flow_id_toeplitz(struct hal_rx_desc *desc)
+{
+	return __le32_to_cpu(desc->u.wcn6855.msdu_start.flow_id_toeplitz);
+}
+
 static bool ath11k_hw_wcn6855_rx_desc_get_mpdu_seq_ctl_vld(struct hal_rx_desc *desc)
 {
 	return !!FIELD_GET(RX_MPDU_START_INFO1_MPDU_SEQ_CTRL_VALID,
@@ -930,6 +945,7 @@ const struct ath11k_hw_ops ipq8074_ops = {
 	.rx_desc_get_decap_type = ath11k_hw_ipq8074_rx_desc_get_decap_type,
 	.rx_desc_get_mesh_ctl = ath11k_hw_ipq8074_rx_desc_get_mesh_ctl,
 	.rx_desc_get_msdu_start_info2 = ath11k_hw_ipq8074_rx_desc_get_msdu_start_info2,
+	.rx_desc_get_flow_id_toeplitz = ath11k_hw_ipq8074_rx_desc_get_flow_id_toeplitz,
 	.rx_desc_get_ldpc_support = ath11k_hw_ipq8074_rx_desc_get_ldpc_support,
 	.rx_desc_get_mpdu_seq_ctl_vld = ath11k_hw_ipq8074_rx_desc_get_mpdu_seq_ctl_vld,
 	.rx_desc_get_mpdu_fc_valid = ath11k_hw_ipq8074_rx_desc_get_mpdu_fc_valid,
@@ -971,6 +987,7 @@ const struct ath11k_hw_ops ipq6018_ops = {
 	.rx_desc_get_decap_type = ath11k_hw_ipq8074_rx_desc_get_decap_type,
 	.rx_desc_get_mesh_ctl = ath11k_hw_ipq8074_rx_desc_get_mesh_ctl,
 	.rx_desc_get_msdu_start_info2 = ath11k_hw_ipq8074_rx_desc_get_msdu_start_info2,
+	.rx_desc_get_flow_id_toeplitz = ath11k_hw_ipq8074_rx_desc_get_flow_id_toeplitz,
 	.rx_desc_get_ldpc_support = ath11k_hw_ipq8074_rx_desc_get_ldpc_support,
 	.rx_desc_get_mpdu_seq_ctl_vld = ath11k_hw_ipq8074_rx_desc_get_mpdu_seq_ctl_vld,
 	.rx_desc_get_mpdu_fc_valid = ath11k_hw_ipq8074_rx_desc_get_mpdu_fc_valid,
@@ -1012,6 +1029,7 @@ const struct ath11k_hw_ops qca6390_ops = {
 	.rx_desc_get_decap_type = ath11k_hw_ipq8074_rx_desc_get_decap_type,
 	.rx_desc_get_mesh_ctl = ath11k_hw_ipq8074_rx_desc_get_mesh_ctl,
 	.rx_desc_get_msdu_start_info2 = ath11k_hw_ipq8074_rx_desc_get_msdu_start_info2,
+	.rx_desc_get_flow_id_toeplitz = ath11k_hw_ipq8074_rx_desc_get_flow_id_toeplitz,
 	.rx_desc_get_ldpc_support = ath11k_hw_ipq8074_rx_desc_get_ldpc_support,
 	.rx_desc_get_mpdu_seq_ctl_vld = ath11k_hw_ipq8074_rx_desc_get_mpdu_seq_ctl_vld,
 	.rx_desc_get_mpdu_fc_valid = ath11k_hw_ipq8074_rx_desc_get_mpdu_fc_valid,
@@ -1053,6 +1071,7 @@ const struct ath11k_hw_ops qcn9074_ops = {
 	.rx_desc_get_decap_type = ath11k_hw_qcn9074_rx_desc_get_decap_type,
 	.rx_desc_get_mesh_ctl = ath11k_hw_qcn9074_rx_desc_get_mesh_ctl,
 	.rx_desc_get_msdu_start_info2 = ath11k_hw_qcn9074_rx_desc_get_msdu_start_info2,
+	.rx_desc_get_flow_id_toeplitz = ath11k_hw_qcn9074_rx_desc_get_flow_id_toeplitz,
 	.rx_desc_get_ldpc_support = ath11k_hw_qcn9074_rx_desc_get_ldpc_support,
 	.rx_desc_get_mpdu_seq_ctl_vld = ath11k_hw_qcn9074_rx_desc_get_mpdu_seq_ctl_vld,
 	.rx_desc_get_mpdu_fc_valid = ath11k_hw_qcn9074_rx_desc_get_mpdu_fc_valid,
@@ -1094,6 +1113,7 @@ const struct ath11k_hw_ops wcn6855_ops = {
 	.rx_desc_get_decap_type = ath11k_hw_wcn6855_rx_desc_get_decap_type,
 	.rx_desc_get_mesh_ctl = ath11k_hw_wcn6855_rx_desc_get_mesh_ctl,
 	.rx_desc_get_msdu_start_info2 = ath11k_hw_wcn6855_rx_desc_get_msdu_start_info2,
+	.rx_desc_get_flow_id_toeplitz = ath11k_hw_wcn6855_rx_desc_get_flow_id_toeplitz,
 	.rx_desc_get_ldpc_support = ath11k_hw_wcn6855_rx_desc_get_ldpc_support,
 	.rx_desc_get_mpdu_seq_ctl_vld = ath11k_hw_wcn6855_rx_desc_get_mpdu_seq_ctl_vld,
 	.rx_desc_get_mpdu_fc_valid = ath11k_hw_wcn6855_rx_desc_get_mpdu_fc_valid,
@@ -1135,6 +1155,7 @@ const struct ath11k_hw_ops wcn6750_ops = {
 	.rx_desc_get_decap_type = ath11k_hw_qcn9074_rx_desc_get_decap_type,
 	.rx_desc_get_mesh_ctl = ath11k_hw_qcn9074_rx_desc_get_mesh_ctl,
 	.rx_desc_get_msdu_start_info2 = ath11k_hw_qcn9074_rx_desc_get_msdu_start_info2,
+	.rx_desc_get_flow_id_toeplitz = ath11k_hw_qcn9074_rx_desc_get_flow_id_toeplitz,
 	.rx_desc_get_ldpc_support = ath11k_hw_qcn9074_rx_desc_get_ldpc_support,
 	.rx_desc_get_mpdu_seq_ctl_vld = ath11k_hw_qcn9074_rx_desc_get_mpdu_seq_ctl_vld,
 	.rx_desc_get_mpdu_fc_valid = ath11k_hw_qcn9074_rx_desc_get_mpdu_fc_valid,
@@ -1177,6 +1198,7 @@ const struct ath11k_hw_ops ipq5018_ops = {
 	.rx_desc_get_decap_type = ath11k_hw_qcn9074_rx_desc_get_decap_type,
 	.rx_desc_get_mesh_ctl = ath11k_hw_qcn9074_rx_desc_get_mesh_ctl,
 	.rx_desc_get_msdu_start_info2 = ath11k_hw_qcn9074_rx_desc_get_msdu_start_info2,
+	.rx_desc_get_flow_id_toeplitz = ath11k_hw_qcn9074_rx_desc_get_flow_id_toeplitz,
 	.rx_desc_get_ldpc_support = ath11k_hw_qcn9074_rx_desc_get_ldpc_support,
 	.rx_desc_get_mpdu_seq_ctl_vld = ath11k_hw_qcn9074_rx_desc_get_mpdu_seq_ctl_vld,
 	.rx_desc_get_mpdu_fc_valid = ath11k_hw_qcn9074_rx_desc_get_mpdu_fc_valid,
diff --git a/drivers/net/wireless/ath/ath11k/hw.h b/drivers/net/wireless/ath/ath11k/hw.h
index 8725e119707b..925785c9f688 100644
--- a/drivers/net/wireless/ath/ath11k/hw.h
+++ b/drivers/net/wireless/ath/ath11k/hw.h
@@ -250,6 +250,7 @@ struct ath11k_hw_ops {
 	u8 (*rx_desc_get_decap_type)(struct hal_rx_desc *desc);
 	u8 (*rx_desc_get_mesh_ctl)(struct hal_rx_desc *desc);
 	u32 (*rx_desc_get_msdu_start_info2)(struct hal_rx_desc *desc);
+	u32 (*rx_desc_get_flow_id_toeplitz)(struct hal_rx_desc *desc);
 	bool (*rx_desc_get_ldpc_support)(struct hal_rx_desc *desc);
 	bool (*rx_desc_get_mpdu_seq_ctl_vld)(struct hal_rx_desc *desc);
 	bool (*rx_desc_get_mpdu_fc_valid)(struct hal_rx_desc *desc);
-- 
2.53.0

