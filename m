Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795381690;
	b=UtjFuZH/faCG0vTBMta739meJSQsYVZLUOPfRMwEdOoQHoW32aGaf9us5Hms4HcFEADQ
	 cOCgH7GhEf/Xgze8jLVIrrNRr0qBj/0JE2gG8At0O7d1H0TZrm3FpVrhR6Nmv4JezOhfr
	 /eA1j4Qkqg6kxhVPMHourUiOu4ZYc2nm3y3BuCYLE1BSSKizcz4wPup03a9CmICRPhMak
	 90fp02m0UPXINmRUULQbPM5qFZWfQX2p7N7XEFqh45mH5ip+hbkgUWlhJVFG4JB6lxV2t
	 FqWQ74GVe+N6FJsu+PCqM5iz7g1feM6OQrXbwzpQzpIFGqCala/frtZe6ozEkjIu9/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795381690;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=aflJJ38bjdZjg38SRGXSXCVpGppEVOtqLz1Kzz0bSiw=;
	b=pV+QF5NhZeQU0DbgPkUeKHvR5xGSds7PTxN+HeGE3/PHLOwnSjBNojFY0q2I3R4QN2ai
	 Rt6IusRjYpJ3ocRxSQYM+rNXLZZwETsR0Qifc0ZBY9LGahHUrb6kHk92aBh0HUE7v8v00
	 MdzbhgnwldoiBHwbYK2ar2Gqu9xWE2IP2Pyj9ChhZ6yZ7sWbLmbAP+ZwwgOKyZT9FgQbs
	 G1ntvFewjsVOQEpwhfDindSdX+Tb6u/7o0a42lPCRi3N2BUOvypqcIpA5UQrphqrlbd+E
	 TH/NLHyN6/LdI6vKakja0nZ/Y5fjCHk24fWG0Db36f19RIA3ykjARwj2f2vdhaxkh9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=PIgVIzCK;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85644606A31D
	for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 21:08:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85644606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=PIgVIzCK
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c4d21051042so436764366b.0
        for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 13:08:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795381688; x=1795986488; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aflJJ38bjdZjg38SRGXSXCVpGppEVOtqLz1Kzz0bSiw=;
        b=PIgVIzCKE6SJkmg6efpInkthL3unvMpL2cFeRF2f1s6ildvJKUgFG0S91ZN7LziRlo
         plLyGAWAuAMQmMSfaWD9i+vRJd9+5MLvSFEQGS8J2wcR2kjUpnIztPTbmgh1oXbHQtFi
         BP0Dv4cbvuTElln7+pZIq/a2B6yfoM0jjygfw9BPZpXzAl0MxRjeAzljgRS1/i48gXJn
         yHA+qUNDUgADSWwdcyZCKl14yNR5FoogL9vzUTq2NBVj1Tc2ZQzEKTUVIY/7ru8v/xUC
         2Z3qKyUH21QP6CHwrVJADbXze5UJa4vGqmEIvaDuhLKq/CXSnKJIHx9xgWazA9iaU2Ez
         F/9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795381688; x=1795986488;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aflJJ38bjdZjg38SRGXSXCVpGppEVOtqLz1Kzz0bSiw=;
        b=scXf02H4BVHpldKbd05VKUkoJkJEiL5EwdMu0WJyrq3Dm1zrKZp+ClpPcXxy4DPGHp
         jtxWvEFgGWYNG+TFu0LQ9yjJV4ywdMK3L8o8FgC+aYwRlET82it5kMY4ZL/GfwMYH5qu
         n3BmIVqZRVHCSZ03DYylZU8G4gWbKttQiPHctoglfPMci68hLETsIhLrsJy3NA1D9lRg
         FbLa7uq0Xsog/K8J54c/Llt3aofaavYC01u+9ggE3IghpMjRFnEU23WRM0DdEeTdGRGK
         5DRglIkv9nxvi6CL42g62NSGf/YgJyBPRmIYwy6BhWSMoTDeTaziquExV2LPlrT6hXRX
         GQ6Q==
X-Gm-Message-State: APuU4Z+hyougbhcG50zyFEmHB9ZHbzmgJXoUJXUWiL9iPFppxLI5uWvF
	YKtCcxTctorThzQ56sGZXkUB4GwmBveiE8og6I54I739rE/5+q73Y/AzSQTJy8nj/knjHk2+eQU
	1FTfOJA==
X-Gm-Gg: AZFdTZcDfgXW/CKuIqfL0V+eIoJY4DJ5nEEIANWGrnNgVHn2ObjuHJwooD8hkMSHzKD
	3bxA39asL3WRtEG5nTw9TyyvhSUvBq2uyc3yij+xDp5uj+frAtkY6Ns5u1H6i8VXckSxFSj8DdF
	61Nl2QOehe1wPbYmp1JaT93bMUCP4uFZRozfSVDT+kmNxgUrMpnfDzprjKntCqA05s3eHrxJ//L
	L72leHFUwWiat9gwb7bmVkve3lsFSyKUS8jQLAcnbIyI9SmejvflwxDQTe6n0sX3USSIxNR0tae
	xxQz2QkOLLUhyUX7Ed7zlKSsog6SoCygcxvvBHEsia9Slviwsjw9Jh1Ojp0/5Fgmm24tJwBe2bj
	OXU1NGlfQ3/SDefULyYIXqlmXsB5ZVT4kFf4uweepfGqVn4nyIP6Dz4TNdgrjkDiZfv5klADoVS
	qIy57ve8PEgbgsbgIRTzB/z5Aihl6CDG4x0DcaK9AmiWmO/w0qx8dhKjsOc0Pf+D5btBiO0DCri
	z+38/uMcEmJnhqqVcDcbPC3AQzREPm8ZpMbffwfBSYKKj8cRKsDteoczmeQf5aP1b0eG7OGhTkY
	9MdOTA8xRptJYlh49+KU63gINnbYBY1+pKGUyGeF1ANGHWOtum6vM/IjQpeF3HOxzmGcwUvX8Wk
	kVzfZQygjjqEeU5vzUjtfAJlf0fcNGuJC7pKHFO14eS4Np0Z+s6Z7slMVnQQXEEKFaPPomK7MeS
	ddanaFlwzweVozgzojLjp17qlR333itXPyiJP7guGHHAxA1Nv4SZ4kuNkMPn804yDr3uPUWUMx/
	zkPpXy9lHpy/9NnCM1jQerQWH6gHDj8dVRxWXKUh1K1yFo3WFu+yYv3ysvBzBcFFhL/MUqR6m6x
	gFE9r3qpjxm01caRVp9ARtt0wL5MEISU2n24gzFRWW1RHLkc+JFrPqdIt2NVs0HODCx2v5OIn2f
	rFZmvcJGeSEHTnoDa8J8=
X-Received: by 2002:a17:906:b7d2:b0:c2e:52d6:1fb7 with SMTP id a640c23a62f3a-c513a82d478mr572934466b.22.1795381687920;
        Sun, 22 Nov 2026 13:08:07 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f24713d50069697652bafd0866.dip0.t-ipconnect.de. [2003:f2:4713:d500:6969:7652:bafd:866])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae9f705sm345077966b.42.2026.11.22.13.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 13:08:07 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Carl Huang <quic_cjhuang@quicinc.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Bhagavathi Perumal S <quic_bperumal@quicinc.com>,
	Kalle Valo <kvalo@kernel.org>,
	Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
Subject: [PATCH ath-next] wifi: ath12k: drop decapped frames with a source other than the station
Date: Sun, 22 Nov 2026 22:08:09 +0100
Message-ID: <20261122210809.2087836-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
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

With Ethernet decap, ath12k hands mac80211 an MSDU with the Ethernet
source the hardware took from the frame, which for an A-MSDU subframe
is whatever its subframe header carries, and mac80211's 802.3 receive
path takes it as the station's address. When mac80211 deaggregates an
A-MSDU itself, ieee80211_amsdu_to_8023s() drops a subframe whose source
is not the station on an access point; the decap path has no such
check.

Drop such an MSDU on an AP for a station that does not use four
addresses, as ath11k does. The address compared with is that of the
ieee80211_sta, which for a multi-link station is its MLD address, the
one mac80211 compares with too. A four-address MPDU from such a station
passes: ath12k_dp_rx_h_undecap() hands it to mac80211 as an 802.11
frame, from which mac80211 reports the station for dynamic WDS.

Found by reading the code.

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
Applies on top of "wifi: ath11k, ath12k: RX correctness fixes",
which changes the same function:
https://lore.kernel.org/all/20261122210525.2076058-1-julius@bairaktaris.de/

I used Claude (Anthropic) to help write these patches.

 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
index 1d52eab418a1..abc3b6d197f1 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
@@ -354,6 +354,40 @@ static void ath12k_wifi7_dp_rx_h_csum_offload(struct sk_buff *msdu,
 			   CHECKSUM_NONE : CHECKSUM_UNNECESSARY;
 }
 
+/*
+ * With Ethernet decap the hardware passes on the source address of the frame,
+ * which the header of an A-MSDU subframe sets, and mac80211's 802.3 path takes
+ * it as the address of the station. An access point takes no other source from
+ * a station that does not use four addresses: mac80211 drops such a subframe
+ * in ieee80211_amsdu_to_8023s() when it deaggregates the A-MSDU itself. The
+ * address it compares with is the station's, its MLD address for a multi-link
+ * station. A four-address frame from such a station is left alone:
+ * ath12k_dp_rx_h_undecap() hands it to mac80211 as an 802.11 frame, from which
+ * mac80211 reports the station for dynamic WDS.
+ */
+static bool ath12k_wifi7_dp_rx_h_eth_sa_valid(struct ath12k_dp_peer *peer,
+					      struct hal_rx_desc_data *rx_info,
+					      struct sk_buff *msdu)
+{
+	struct ath12k_sta *ahsta;
+	struct ethhdr *eth;
+
+	if (rx_info->decap_type != DP_RX_DECAP_TYPE_ETHERNET2_DIX ||
+	    !peer->sta || peer->use_4addr ||
+	    (rx_info->is_from_ds && rx_info->is_to_ds))
+		return true;
+
+	ahsta = ath12k_sta_to_ahsta(peer->sta);
+	if (ahsta->ahvif->vdev_type != WMI_VDEV_TYPE_AP)
+		return true;
+
+	if (msdu->len < ETH_HLEN)
+		return false;
+
+	eth = (struct ethhdr *)msdu->data;
+	return ether_addr_equal(eth->h_source, peer->sta->addr);
+}
+
 static int ath12k_wifi7_dp_rx_h_mpdu(struct ath12k_pdev_dp *dp_pdev,
 				     struct sk_buff *msdu,
 				     struct hal_rx_desc_data *rx_info)
@@ -390,6 +424,9 @@ static int ath12k_wifi7_dp_rx_h_mpdu(struct ath12k_pdev_dp *dp_pdev,
 				return -EINVAL;
 		}
 
+		if (!ath12k_wifi7_dp_rx_h_eth_sa_valid(peer, rx_info, msdu))
+			return -EINVAL;
+
 		/* resetting mcbc bit because mcbc packets are unicast
 		 * packets only for AP as STA sends unicast packets.
 		 */

base-commit: 1983b40acfcb3c3464b291c85977290a785bcfdc
prerequisite-patch-id: ed566369a9bbda0ac9a48357261e8cfe1cc0f1d1
prerequisite-patch-id: 726d7737c833da0842192eccececad4a0dedb1a6
prerequisite-patch-id: cf0b8ff1ac6cef681433247e4b937a3e23af78a3
prerequisite-patch-id: 03c89df01745ac9a80653431261f9a003dbca7db
prerequisite-patch-id: cb48c0eddbe0c2fe176e8edc94c6bc40be3c48a9
prerequisite-patch-id: 1956ec85ad80b68868538070fc0e89c29603467a
-- 
2.53.0

