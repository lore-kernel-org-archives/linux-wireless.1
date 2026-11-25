Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.21.23.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795597423;
	b=gAKg6JJs0W/+QFPDRfxz5GvLiOOQPOkkxjwIe7zj2X7bsFTd77p3U1FO4WUpMAj2bAeM
	 pBNeuF96EoVe5a3QpHlihHHukvE/tQzLasURkFDOu0KRBm/X5CwYQ4Qe9R4/9IP2EfKLC
	 1I1eZYxg3RJIFrFDZs7seQt66+BGomC/uy29gZfd+S0sqtsTDOxoF8zPVmClQA/SLCRzH
	 KduIg+a4Y4p9MoNWv7vNrvADzZH31dGNTL6FpkLPtJ40N2HxDUce2Rv89lqWx+KF4JY5C
	 PXlr5bKWH/v1FMS3hJYG33obxhNmUjudQEfMuaSzFjfFXWza+myVVa4G0idTdqgjHtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795597423;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:From:
	 To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Transfer-Encoding;
	bh=3NO5y6ayBAJg4ntaAXlveYpYKcCNROKO20ivtZtEcH0=;
	b=hT+/tLwxb5KU+MlCEo+PmEnmzTqQewdznZmiAJY5yp+MmpRCbJPXoALRC5waY982qldf
	 e6MCW4Z78tQG90MMJhzVSBrAKsBNh8wb16L2IYZVgirgY0eww8spTaa6xwDTqcC0gsPq8
	 oOqp9BETGWMbtGD3Y5XTWL9HS7Qk+4R8SVqYAYqREANV8+iG04qaMzpTjRCKUrD/44pUK
	 8J845+DvFAa2kXXhzD9auPmAjQZTKVkdHU/vR2CEU8DMTIS9z2UuKuA8KaMuWiyT0Hqwr
	 c2EHVr6ohMaPHywWSITDSWd3cO/h4IPCv8mi0L0cJrtRTJJQck1t3Z273r8x0Z/94eA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=disroot.org;
	spf=pass smtp.mailfrom=disroot.org;
	dkim=pass header.d=disroot.org header.i=@disroot.org header.a=rsa-sha256 header.s=mail header.b=Ds3KC7mw;
	arc=none smtp.remote-ip=178.21.23.139
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D760606A321
	for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 09:03:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D760606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=disroot.org header.i=@disroot.org header.a=rsa-sha256 header.s=mail header.b=Ds3KC7mw
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 67B88801EC;
	Wed, 25 Nov 2026 10:03:34 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mexDO8_o3FpM; Wed, 25 Nov 2026 10:03:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1795597413; bh=LdIdjHEjBPym/Go2AUDixRle9Ee2BldDbNoa59zdqNs=;
	h=From:To:Cc:Subject:Date;
	b=Ds3KC7mwnAuzZAB5y2IW0QkqT0hT8ZrlPF9nW5L4rZNJ6EzpStfbQrm+6emmgsLaP
	 a6I2GkpLEPr92ZUfv9q1Frk4aL89fu9OcsW83JkwvmEzcjVjMCrina2pkgZn6INlTa
	 5wk2KhAq2IjcI1qvOX8f3sM1qtJspaNtR5sie/pmxydMRIyWtnX8vTdeLiRNrygvRu
	 7NC8cD2Mk+SpfsIdYadDu/FlTMsqPb58QET/fhNx5EuTds37PIqFHMxZYGBeOBJFRa
	 hFtkjE1u/ZU0trgcDkzaBelMUVXgjI2Ne0UcSRo9BPtdkK+nETg/xK+cwej4XrqXTG
	 GEPkJacGrRcZw==
From: Florian Maurer <fmaurer@disroot.org>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	Florian Maurer <fmaurer@disroot.org>
Subject: [PATCH ath-next] wifi: ath11k: invalidate the REO queue SSN when RX aggregation stops
Date: Wed, 25 Nov 2026 09:03:20 +0000
Message-ID: <20261125090320.3890628-1-fmaurer@disroot.org>
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

Since commit fe201947f8bd ("ath11k: update bawindow size in delba
process"), stopping RX aggregation no longer deletes the REO queue of
the TID, so that frames sent without a new ADDBA are not dropped as
invalid. The queue is shrunk to a window of 1 but keeps its window head
and its SSN-valid bit. If the peer then restarts its sequence numbers
without a new ADDBA, REO drops its frames as old until they pass that
head again, for up to 2047 frames.

This happens in an 802.11s mesh when a peer restarts or rejoins without
HT: mac80211 stops the RX sessions ("wifi: mac80211: mesh: tear down BA
sessions when the peer link goes down"), and the peer starts again from
sequence number 0. In AP/STA mode a restarted peer reassociates and gets
a new queue.

Clear the SSN-valid bit when stopping, so that the queue is in the same
state as a newly set up one (ath11k_hal_reo_qdesc_setup()).
ath11k_dp_peer_rx_pn_replay_config() already clears it on active queues
when a pairwise key is installed.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1

Fixes: fe201947f8bd ("ath11k: update bawindow size in delba process")
Signed-off-by: Florian Maurer <fmaurer@disroot.org>
---
Tested on a Xiaomi AX3600 (OpenWrt, 6.18 backports) as the node that
keeps the station in an open 802.11s mesh, with the mac80211 patch [1]:
 - peer rejoins without HT: replies in the first 50 s 0/50 without this
   patch, 48-49/50 with it (4/4 runs each); HT20 rejoins unchanged
 - an ath10k neighbour reboots: its frames were dropped for 4.5 min to
   over 20 min without both patches (3/3), and got through right after
   its boot with them (2/2)
No firmware crash or REO command failure. Not tested: encrypted mesh
(the key install already clears the bit), AP/STA, other ath11k chips.
ath12k_dp_rx_ampdu_stop() has the same pattern; I have no ath12k
hardware to test it.

[1] https://lore.kernel.org/r/20261120142515.463101-1-fmaurer@disroot.org/

 drivers/net/wireless/ath/ath11k/dp_rx.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 6d95f7b343a5..f3108aa992bc 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -955,6 +955,9 @@ static int ath11k_peer_rx_tid_reo_update(struct ath11k *ar,
 	if (update_ssn) {
 		cmd.upd0 |= HAL_REO_CMD_UPD0_SSN;
 		cmd.upd2 = FIELD_PREP(HAL_REO_CMD_UPD2_SSN, ssn);
+	} else {
+		/* drop the old window head, as for a newly set up queue */
+		cmd.upd0 |= HAL_REO_CMD_UPD0_SVLD;
 	}
 
 	ret = ath11k_dp_tx_send_reo_cmd(ar->ab, rx_tid,

base-commit: 18d0bedbb5f0538396cb7f763ed9cd1dd69c5b23
-- 
2.47.3

