Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795881821;
	b=d9kHd4E/8W46JRt0n6Fg/OjGezYTCBdslIuOzXY/oDHd2MiDT404/g6cIeyR8uBUjMVx
	 Zz20Whg7FQJuQ85Yk3o7mbg7xaBUWq08QkKzbCAVk+GIxPtkxaZpPQRoiIOnvycxJKyr8
	 91QjSg1rK9aW+Amuwy38po1vOG3kMeuPgI3DyGcU0H1GZj1Dim2elcWRCWUc3DCLQuhiG
	 dszsZRI9DsJ4OxmTsJ6hlC/fJbLcQWhdmX17RIbp/QEyg//4U+QEI1lylRUjj0qw2sqEQ
	 PR5wxN9URCmJsdS392FPUxmDHKUbezc7H/6cZBHNyR3+ZRWv00bb33oTTRkH0safw5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795881821;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=l0KqIf20BL/9VhpTuh3BbPHRdDbiuv9sbaK8NTXw8wk=;
	b=nEL01OnSLhjSadFv2Imt8EI+w1p7V1oxFzptd+IODsMmP8muf6u1g+r8L3jWDX/dsEMq
	 EVnauznbP5Ku2gIs2f0cLI5lCsp/4RnFp5Ywf1/lKWnzws/jSrb/PMrVV2e4Az8J080XK
	 SYcN/Nneg1SD+NtACsHySsniZgJaVL6dxYPh+dpYr4rZVjutx/XZUc18Zk0DvLSngYFed
	 5atn6LDq1PIAB54ReP07CkGyPhe5PQ56N3n7qMBXRZ4436AkvfuxbWfkzSBVjtLCU7GBd
	 7M4L7Ci3RSzSeqmPvc9c2xlVIxJRXMoqGv3IMwL4Mw4G2RAdwfv+bWdai/Vv7twD97Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=Qgm7SOBn;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D6E60A2617
	for <linux-wireless@vger.kernel.org>; Sat, 28 Nov 2026 16:03:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59D6E60A2617
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=Qgm7SOBn
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c50aaad19fbso969242266b.0
        for <linux-wireless@vger.kernel.org>; Sat, 28 Nov 2026 08:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795881819; x=1796486619; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l0KqIf20BL/9VhpTuh3BbPHRdDbiuv9sbaK8NTXw8wk=;
        b=Qgm7SOBnHDIlVGZ2jtx4jCHe2Dvk3oSBqaICJnG+Dpix04tOhV9sBvV49UZJZ36AGv
         vRnELRhosvt0oCFWN0hCEhpPAfPJPS0Z7j96KJ5Lgk0FyfRnxIyMmyKb5T/NfSIrlaVN
         0mdFhmdrvrlMXpRc25KHGrMdMJPdZA/Y9NNCEDbUvk3VF7fhy7C4Itee7Dtd3sCxf58l
         w9IpL22rlLGKfBLPVyNgvnXNWuh/10jHi6ssTBFNv+t7gEU6Olf/TImxJrnTJtELuza6
         CJ6lBYwrSR1fZ9p1h80tgJ7fltQcfhmcEBF1BY9aKK9RaXyTBgo1OuBLqIAe9pzeD6VM
         K/8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795881819; x=1796486619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l0KqIf20BL/9VhpTuh3BbPHRdDbiuv9sbaK8NTXw8wk=;
        b=JsaXXBVEyWhwpGOX7llQDkHfBjq3XJyCVWnFAChBejEcUyBEbSXRrCMP6kPKI2ZKwA
         zr5XjOfJiYNvFFREb/ED4tlj5nuLcXXf254Lnrl83sTfjXn+nQx7wvLiFZx+goJ2sK4/
         GF6swR/smHBLb2QHTR2urrgujr1saoNlIOrhbFlF2LDxNZIrrfnNgA0OGcsPGz2ezFg3
         JLsL/LGQlZenpvl6IFgIvdxVCewf4zgKI2pbWFm+ajuOg8P7MzGmRtToxbOW6at45jf9
         A+gugP5qtuXYX8RzqCIvd2fsjRhruEbdEu8SU8/AZuEaW9WUTVcTjkfKevF/OE1kfRDN
         Rf8g==
X-Gm-Message-State: APuU4Z+yu7Y4bujxaoy1tm6A7I+GdTJElIM0QUxmNZDr/lHBNguR8BnT
	1aFzoGxtnlVK7FnlsYAvWJ3bumxYy8QR7q4zIekprjdPdo38lwTZVkIcaRhTGcjLiQ==
X-Gm-Gg: AZFdTZc8YwxIKlaMPeEMaW5PAXKqgWDhksSJkT/8x0LjAyJUn8fsvvr1zaLoCyR9lCD
	/l5J+Qu5pKoseYGMDTL21awcn2P1lZcVXJm7tjfT3p7uz4iPu6EUe156hMm4TqaUJ5aaUyc4/HU
	pbl3QR/guyfAteYo4H4orBlJlZfZ1NvY3upVqAdZVLKVRZsThZaCy3vJg4oQU3xV+TUFBfmxS+O
	4d7dLRloi/zACv5Tg+dSXIZg1QDff7XxJA1wv0P98beYrC+n6VoTrVDX/flzAnTaftrcm8n+AQq
	aWgedm8jA6aBEFBDsxM37iANLSoef3CxRzByxhz9VrqVn9yutus+BqX0oIVrBXtlTgsRrPu6Kuk
	0bUSPU3B1J9PAc1iaUmL8OjZFSK/ZV1Ma0owVEgiRletMNZFfXqpSSr7ZheU6aVSImfDHO38svP
	AF/sSxEbfU+b483o5D69DOqNCDhn918hbg8PtRMRN10mBBtdVcrKNWwmNFIyBSc5Zw45l0GZpPc
	jkdnLC1Kkhl56knndiGYAnuwIRdx4TptGL7BEpqnyTvTvuSZeX5+r2e45w1iiHgbapgKtevBhCg
	CrD+WvzMbFkGRLARkQhMRwkQ7bQ2JBUI3RTFx/V8TeZLDgpPb+BsSJWZOcpVNO/5imhlY19kWqA
	DJgiIWe9vHde4T79hLZz0OZ1yl9aceIvlbcFGZ0wQFWxURVI1+6EeuzKh+eylkaTbGDc5sln+c2
	ILUHzlzAM6gyk4IYV2CuXyGlOAvFbA7id7w35HrmsSzP3hsYLIMsdJ4HcCP1YRKNnYBdHf4ACai
	/Uquj9h79OlCq2WmgG7z8vyRaZBtEXaHKz/umCkBfRNDb3XQLJCTlkpzkKfZP4dp7U8xUk9cvhM
	5e426NU5nJtcnQ==
X-Received: by 2002:a17:907:fd15:b0:c40:33d:f06f with SMTP id a640c23a62f3a-c513aaad90bmr2317289066b.39.1795881818727;
        Sat, 28 Nov 2026 08:03:38 -0800 (PST)
Received: from Desktop.tail070c67.ts.net ([185.152.145.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b022e84sm990389566b.84.2026.11.28.08.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 08:03:38 -0800 (PST)
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
Subject: [PATCH wireless-next v2 7/7] wifi: ath12k: pass the TID of a received 802.3 frame to mac80211
Date: Sat, 28 Nov 2026 17:03:35 +0100
Message-ID: <20261128160335.1815537-8-julius@bairaktaris.de>
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

ath12k_dp_rx_deliver_msdu() delivers frames with Ethernet decap as
RX_FLAG_8023, and mac80211 counted all of them on TID 0. Pass the TID
from the rx descriptor data of the MSDU, or IEEE80211_NUM_TIDS when the
MPDU has no QoS control. The TID field has 4 bits, so add the QoS
control valid bit of MPDU_START to struct hal_rx_desc_data.

Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
v2:
- Take the TID from rx_info instead of rxcb->tid, which
  *rx_status = *status overwrote before v1 read it. Found by the
  hosted Sashiko review of v1.
- Pass IEEE80211_NUM_TIDS for a frame without QoS control. Found by an
  LLM review (Claude).

 drivers/net/wireless/ath/ath12k/dp_rx.c             | 2 ++
 drivers/net/wireless/ath/ath12k/hal.h               | 1 +
 drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.c | 8 ++++++++
 drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c | 9 +++++++++
 drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.c | 9 +++++++++
 5 files changed, 29 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index 52838ade1b1d..cfa539df09d2 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -1409,6 +1409,8 @@ void ath12k_dp_rx_deliver_msdu(struct ath12k_pdev_dp *dp_pdev, struct napi_struc
 
 	rx_status = IEEE80211_SKB_RXCB(msdu);
 	*rx_status = *status;
+	rx_status->tid = rx_info->qos_ctrl_valid ? rx_info->tid :
+						    IEEE80211_NUM_TIDS;
 
 	/* TODO: trace rx packet */
 
diff --git a/drivers/net/wireless/ath/ath12k/hal.h b/drivers/net/wireless/ath/ath12k/hal.h
index 343e1636b4cc..0c61a08f4374 100644
--- a/drivers/net/wireless/ath/ath12k/hal.h
+++ b/drivers/net/wireless/ath/ath12k/hal.h
@@ -739,6 +739,7 @@ struct hal_rx_desc_data {
 	    is_mcbc:1,
 	    seq_ctl_valid:1,
 	    fc_valid:1,
+	    qos_ctrl_valid:1,
 	    is_to_ds:1,
 	    is_from_ds:1;
 	u16 msdu_len;
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.c b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.c
index bad2b60409d9..3f0dfeedcb31 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.c
@@ -260,6 +260,12 @@ static bool ath12k_hal_rx_desc_get_mpdu_fc_valid_qcc2072(struct hal_rx_desc *des
 			       RX_MPDU_START_INFO4_MPDU_FCTRL_VALID);
 }
 
+static bool ath12k_hal_rx_desc_get_mpdu_qos_ctrl_valid_qcc2072(struct hal_rx_desc *desc)
+{
+	return !!le32_get_bits(desc->u.qcc2072.mpdu_start.info4,
+			       RX_MPDU_START_INFO4_MPDU_QOS_CTRL_VALID);
+}
+
 static u16 ath12k_hal_rx_desc_get_mpdu_start_seq_no_qcc2072(struct hal_rx_desc *desc)
 {
 	return le32_get_bits(desc->u.qcc2072.mpdu_start.info4,
@@ -403,6 +409,8 @@ static void ath12k_hal_extract_rx_desc_data_qcc2072(struct hal_rx_desc_data *rx_
 	rx_desc_data->seq_ctl_valid =
 				ath12k_hal_rx_desc_get_mpdu_seq_ctl_vld_qcc2072(rx_desc);
 	rx_desc_data->fc_valid = ath12k_hal_rx_desc_get_mpdu_fc_valid_qcc2072(rx_desc);
+	rx_desc_data->qos_ctrl_valid =
+		ath12k_hal_rx_desc_get_mpdu_qos_ctrl_valid_qcc2072(rx_desc);
 	rx_desc_data->seq_no = ath12k_hal_rx_desc_get_mpdu_start_seq_no_qcc2072(rx_desc);
 	rx_desc_data->msdu_len = ath12k_hal_rx_desc_get_msdu_len_qcc2072(ldesc);
 	rx_desc_data->sgi = ath12k_hal_rx_desc_get_msdu_sgi_qcc2072(ldesc);
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c
index 0f85ae69b5e0..060e5ea1f7fd 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c
@@ -722,6 +722,13 @@ bool ath12k_hal_rx_desc_get_mpdu_fc_valid_qcn9274(struct hal_rx_desc *desc)
 			       RX_MPDU_START_INFO4_MPDU_FCTRL_VALID);
 }
 
+static inline
+bool ath12k_hal_rx_desc_get_mpdu_qos_ctrl_valid_qcn9274(struct hal_rx_desc *desc)
+{
+	return !!le32_get_bits(desc->u.qcn9274_compact.mpdu_start.info4,
+			       RX_MPDU_START_INFO4_MPDU_QOS_CTRL_VALID);
+}
+
 static inline
 u16 ath12k_hal_rx_desc_get_mpdu_start_seq_no_qcn9274(struct hal_rx_desc *desc)
 {
@@ -1024,6 +1031,8 @@ void ath12k_hal_extract_rx_desc_data_qcn9274(struct hal_rx_desc_data *rx_desc_da
 	rx_desc_data->seq_ctl_valid =
 		ath12k_hal_rx_desc_get_mpdu_seq_ctl_vld_qcn9274(rx_desc);
 	rx_desc_data->fc_valid = ath12k_hal_rx_desc_get_mpdu_fc_valid_qcn9274(rx_desc);
+	rx_desc_data->qos_ctrl_valid =
+		ath12k_hal_rx_desc_get_mpdu_qos_ctrl_valid_qcn9274(rx_desc);
 	rx_desc_data->is_from_ds = ath12k_wifi7_hal_rx_h_from_ds_qcn9274(ldesc);
 	rx_desc_data->is_to_ds = ath12k_wifi7_hal_rx_h_to_ds_qcn9274(ldesc);
 	rx_desc_data->seq_no = ath12k_hal_rx_desc_get_mpdu_start_seq_no_qcn9274(rx_desc);
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.c b/drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.c
index 2d66d71d1b9b..3751bf8589ba 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.c
@@ -340,6 +340,13 @@ bool ath12k_hal_rx_desc_get_mpdu_fc_valid_wcn7850(struct hal_rx_desc *desc)
 			       RX_MPDU_START_INFO4_MPDU_FCTRL_VALID);
 }
 
+static inline
+bool ath12k_hal_rx_desc_get_mpdu_qos_ctrl_valid_wcn7850(struct hal_rx_desc *desc)
+{
+	return !!le32_get_bits(desc->u.wcn7850.mpdu_start.info4,
+			       RX_MPDU_START_INFO4_MPDU_QOS_CTRL_VALID);
+}
+
 static inline
 u16 ath12k_hal_rx_desc_get_mpdu_start_seq_no_wcn7850(struct hal_rx_desc *desc)
 {
@@ -620,6 +627,8 @@ void ath12k_hal_extract_rx_desc_data_wcn7850(struct hal_rx_desc_data *rx_desc_da
 	rx_desc_data->seq_ctl_valid =
 		ath12k_hal_rx_desc_get_mpdu_seq_ctl_vld_wcn7850(rx_desc);
 	rx_desc_data->fc_valid = ath12k_hal_rx_desc_get_mpdu_fc_valid_wcn7850(rx_desc);
+	rx_desc_data->qos_ctrl_valid =
+		ath12k_hal_rx_desc_get_mpdu_qos_ctrl_valid_wcn7850(rx_desc);
 	rx_desc_data->seq_no = ath12k_hal_rx_desc_get_mpdu_start_seq_no_wcn7850(rx_desc);
 	rx_desc_data->msdu_len = ath12k_hal_rx_desc_get_msdu_len_wcn7850(ldesc);
 	rx_desc_data->sgi = ath12k_hal_rx_desc_get_msdu_sgi_wcn7850(ldesc);
-- 
2.53.0

