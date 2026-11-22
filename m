Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.21.23.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795307722;
	b=3FDKEFV2ipWYchcMDT6edYkOTsIU2fLOrCxBsXmClP5BA2Lv1uOGk5eYyw/gk7CkosNn
	 UOf0AbDP3e+dXHZQpDg/5zSE67NRBdD7i3GpwyXcwBQuW8tWj8XGV/cnlLvuOIwxDhCmv
	 ZcKPUSK2wmJ0R98Ms/vooRQU+qYA0m1tsUtoGRdJr0NwILT8aBJR6NVXzegehHw3+qdnW
	 HhX2vvfxdCpN12e03gAcJfmBpEn3oPADJfjK0sMmbaA5ly7TT5g78Ue7N0231xozYVTEW
	 +tJ1IaT7H1plAXfibYWRFvHzjJlRNTXUHSCCi9akVESYUf3QxHOwzxVDKt1n97utNXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795307722;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:From:
	 To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Transfer-Encoding;
	bh=7c9wposL7FoBMaF6sQclNui8QgJzbTWrd8/a1Tb7/Eg=;
	b=5id8KlVh34Fe7LBDf+Y3Z21lQrMhEFpmRYwnBtzo5ih9Lw/QrWJ9MXBcFPeAe9nLLCPS
	 9ApWLZoY2xpf5b/gOkxCqpkdx5t6I7hyDre9qGdZgW4ZBJ8tgH2gIa5MRvpZjTWvfxYMp
	 dqG92Oa2hUFHeft/oVXgrqt9gmtN/J32VLfa6zlKCCuY8CvDepLCYulz0/EiSPuOU6Mk9
	 H1hjm7Fe3js+UEcZ+PFBw166ToLWzSbqQVUr0DrONnlpLmil+x1WGOcbWGqoMhg2n1QoA
	 vvg2HR2rjhVXZg/onIKpfc1kNPlKg9pZxKy2EhPRCHTVHn/SpxW1IQAQR+wg9rz1W6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=disroot.org;
	spf=pass smtp.mailfrom=disroot.org;
	dkim=pass header.d=disroot.org header.i=@disroot.org header.a=rsa-sha256 header.s=mail header.b=c2XofF4z;
	arc=none smtp.remote-ip=178.21.23.139
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D29E606A320
	for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 00:35:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D29E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.a=rsa-sha256 header.s=mail header.b=c2XofF4z
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 6CED083093;
	Sun, 22 Nov 2026 01:35:19 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b1i_BXv_6zi7; Sun, 22 Nov 2026 01:35:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1795307718; bh=b43CRIy9vuGgmkfUortEURINrAc2oafAmnPD3fPVamk=;
	h=From:To:Cc:Subject:Date;
	b=c2XofF4zAMzkFWq+yfyWtMCALEHpr4VAM+kVxtVSi3ng1QbGnNgsTIKQbR0pJ4iq2
	 dep66lgQWYsLRmffeq9Ici1PDvfpf7M5x29e34hzglhDy3wnV1W+ZP//OggnjvAO6N
	 Ff6EWKJc+qHkgYFHMf803BE8tfIMsTfPO5bzrIDGMd89aOKBOCg1eDVetOcF6SdHAP
	 7fDrokMTF9ZPHaiPxaimnklmhrbz7aDpszZ7xJzyP7w4ChrvmDzv+fRjTs3Sn5h66t
	 R2vZwNvCzrzH8jEggdH/FyP9FpiR+PDsZMZM4J1IKGpkU1MXg6Uam4HB9GNnGc7/f8
	 r08EPNlij7jsQ==
From: Florian Maurer <fmaurer@disroot.org>
To: jjohnson@kernel.org
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	Florian Maurer <fmaurer@disroot.org>
Subject: [PATCH ath-next] wifi: ath11k: don't send A-MSDUs on mesh interfaces
Date: Sun, 22 Nov 2026 00:35:04 +0000
Message-ID: <20261122003504.3341873-1-fmaurer@disroot.org>
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

The firmware counts the Mesh Control in the length field of a mesh
A-MSDU subframe, which 802.11-2020 excludes. mac80211 detects both
formats on reception since commit 6e4c0d0460bd ("wifi: mac80211: add a
workaround for receiving non-standard mesh A-MSDU"), but a receiver
that de-aggregates A-MSDUs in hardware only knows the standard one. An
MT7996 receiver looks for the second subframe a few bytes behind its
real start and drops every subframe but the first, which stalls TCP
over the link.

The firmware builds the A-MSDUs itself, so the driver cannot change
their format. Limit A-MSDUs on mesh vdevs to one MSDU with
WMI_VDEV_SET_CUSTOM_AGGR_SIZE_CMDID. The firmware applies the limit to
peers created after the command, so send it right after the vdev is
created. The rx aggregation size is marked invalid, so the block ack
window for received frames is not changed.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Signed-off-by: Florian Maurer <fmaurer@disroot.org>
---
Tested in a mesh of a Xiaomi AX3600 (IPQ8074) and a Gemtek W1700K
(MT7996 with hardware A-MSDU de-aggregation), 20 s TCP runs from the
AX3600 to the W1700K over 5 GHz. A-MSDUs were forced on the AX3600
with vdev param 0x83 (AMSDU_AGGREGATION_SIZE_OPTIMIZATION) = 0; by
default this firmware bundles only about 0.1 % of the frames. MSDUs
inside A-MSDUs were counted from the tx completions:

  without the limit: 161-206 Mbit/s, 2683-3390 retransmissions,
                     4735-6061 MSDUs in A-MSDUs
  with the limit:    242-268 Mbit/s, 0 retransmissions,
                     64-276 MSDUs in A-MSDUs (all on the AP vdev)

Setting the limit on a vdev with an existing mesh peer had no effect
until the peer was deleted and re-added.

The rx aggregation size stays unchanged: TCP from an MT7915 peer to the
AX3600 (2.4 GHz, HE20) ran at 130-144 Mbit/s without and 131-140 Mbit/s
with the patch, and the peer sent about 90 % of its A-MPDUs with 80-103
MPDUs in both cases.

The command was already defined in ath11k/wmi.h (and ath12k, ath10k)
but not used. ath10k, also named in commit 6e4c0d0460bd, is not
covered; it can limit A-MSDUs only for the whole device (HTT aggr
config).

The command layout and enable_bitmap bits follow
wmi_vdev_set_custom_aggr_size_cmd_fixed_param in Qualcomm's fw-api:
https://android.googlesource.com/kernel/msm-modules/wlan-fw-api/+/refs/tags/android-14.0.0_r0.140/fw/wmi_unified.h#5661

 drivers/net/wireless/ath/ath11k/mac.c | 12 +++++++++
 drivers/net/wireless/ath/ath11k/wmi.c | 36 +++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/wmi.h | 18 ++++++++++++++
 3 files changed, 66 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 1a237adaa..71381d1b8 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -7306,6 +7306,18 @@ static int ath11k_mac_op_add_interface(struct ieee80211_hw *hw,
 			    arvif->vdev_id, ret);
 	}
 
+	/* The firmware counts the Mesh Control in the length of a mesh
+	 * A-MSDU subframe, which 802.11-2020 excludes. Receivers that
+	 * de-aggregate in hardware, e.g. mt7996, lose all subframes but
+	 * the first, so do not send A-MSDUs on a mesh interface.
+	 */
+	if (arvif->vdev_subtype == WMI_VDEV_SUBTYPE_MESH_11S) {
+		ret = ath11k_wmi_vdev_set_max_amsdu(ar, arvif->vdev_id, 1);
+		if (ret)
+			ath11k_warn(ar->ab, "failed to disable A-MSDU for mesh vdev %d: %d\n",
+				    arvif->vdev_id, ret);
+	}
+
 	ath11k_dp_vdev_tx_attach(ar, arvif);
 
 	if (vif->type != NL80211_IFTYPE_MONITOR &&
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 82f85df48..e398bb025 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -1635,6 +1635,42 @@ int ath11k_wmi_vdev_set_param_cmd(struct ath11k *ar, u32 vdev_id,
 	return ret;
 }
 
+int ath11k_wmi_vdev_set_max_amsdu(struct ath11k *ar, u32 vdev_id,
+				  u32 num_msdu)
+{
+	struct ath11k_pdev_wmi *wmi = ar->wmi;
+	struct wmi_vdev_set_custom_aggr_size_cmd *cmd;
+	struct sk_buff *skb;
+	int ret;
+
+	skb = ath11k_wmi_alloc_skb(wmi->wmi_ab, sizeof(*cmd));
+	if (!skb)
+		return -ENOMEM;
+
+	cmd = (struct wmi_vdev_set_custom_aggr_size_cmd *)skb->data;
+	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG,
+				     WMI_TAG_VDEV_SET_CUSTOM_AGGR_SIZE_CMD) |
+			  FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
+	cmd->vdev_id = vdev_id;
+	cmd->tx_aggr_size = num_msdu;
+	cmd->enable_bitmap = FIELD_PREP(WMI_VDEV_CUSTOM_AGGR_TYPE,
+					WMI_VDEV_CUSTOM_AGGR_TYPE_AMSDU) |
+			     WMI_VDEV_CUSTOM_RX_AGGR_SIZE_DIS;
+
+	ret = ath11k_wmi_cmd_send(wmi, skb, WMI_VDEV_SET_CUSTOM_AGGR_SIZE_CMDID);
+	if (ret) {
+		ath11k_warn(ar->ab,
+			    "failed to send WMI_VDEV_SET_CUSTOM_AGGR_SIZE_CMDID\n");
+		dev_kfree_skb(skb);
+	}
+
+	ath11k_dbg(ar->ab, ATH11K_DBG_WMI,
+		   "cmd vdev set custom aggr size vdev %d max amsdu %d\n",
+		   vdev_id, num_msdu);
+
+	return ret;
+}
+
 int ath11k_wmi_send_stats_request_cmd(struct ath11k *ar,
 				      struct stats_request_params *param)
 {
diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
index b2dade051..5cda2e6c1 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -3535,6 +3535,22 @@ struct wmi_force_fw_hang_cmd {
 	u32 delay_time_ms;
 };
 
+#define WMI_VDEV_CUSTOM_AGGR_TYPE		BIT(2)
+#define WMI_VDEV_CUSTOM_RX_AGGR_SIZE_DIS	BIT(4)
+
+enum wmi_vdev_custom_aggr_type {
+	WMI_VDEV_CUSTOM_AGGR_TYPE_AMPDU,
+	WMI_VDEV_CUSTOM_AGGR_TYPE_AMSDU,
+};
+
+struct wmi_vdev_set_custom_aggr_size_cmd {
+	u32 tlv_header;
+	u32 vdev_id;
+	u32 tx_aggr_size;
+	u32 rx_aggr_size;
+	u32 enable_bitmap;
+} __packed;
+
 struct wmi_vdev_set_param_cmd {
 	u32 tlv_header;
 	u32 vdev_id;
@@ -6497,6 +6513,8 @@ int ath11k_wmi_vdev_install_key(struct ath11k *ar,
 				struct wmi_vdev_install_key_arg *arg);
 int ath11k_wmi_pdev_bss_chan_info_request(struct ath11k *ar,
 					  enum wmi_bss_chan_info_req_type type);
+int ath11k_wmi_vdev_set_max_amsdu(struct ath11k *ar, u32 vdev_id,
+				  u32 num_msdu);
 int ath11k_wmi_send_stats_request_cmd(struct ath11k *ar,
 				      struct stats_request_params *param);
 int ath11k_wmi_send_pdev_temperature_cmd(struct ath11k *ar);

base-commit: 1983b40acfcb3c3464b291c85977290a785bcfdc
