Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795886547;
	b=wIqqHxp67I3wU7HOVXVnfkC+X0HaeWuu+qlouANNwZpFacsQb/NI7NPc197g5muXwcIj
	 ErmkOii/nxhNMMYF1eidiGqye/cfeNhQDrQoSgrKzJGA7uw/z0ZjrSWAd9i2ii7O0vJ9u
	 YDCTL7bjA78MgkG9M7b4QHdw2Nm+N51O1i1+8aMNNcRPCSdPFmPnZp2RD7/TvAjI+4SXu
	 EIEdhytQo8S48x1lE+TVHXm69RBQJNjAj8sPB+l4Z1eLMWXbYL2D5c0gJsC4DB+WVwjQw
	 L5G8xnKZdpym6RSdE+RKPe9A78lyJkKckwnB40kej5jr9q/HrlX5eaCi+Eb3JALZd1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795886547;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=DMbvLhVt9/6Byoyb38QB8bC7RSl2nRVkt3CkxY9/jJY=;
	b=Gee1p4t7O36SfxUL+zr38xsygA7hpwxq+uaC3NLNsX6Rrc63B87KPlqoC21EFz2fUpiM
	 AVNmc36PMRjPHMdG4reZK9U9Pih5dFvB7vqspzRtkOiLDtKPaS/ifzuxtESf9KVSUnqUw
	 rRjfVR+iwGEI8jZw4qPEmeRklYIK0VB1Av2bwGAOKfOgsbbljvO9qjd7X6mwPs93QANH9
	 10cpZ8JOXIHtT8HMWX0otevn8gIN+8V/SP6NcrxNPYEVmAtzfdSh5Q3xt3WP5f1RoEfdY
	 xLE9qpasr6m86XJ+94i44lNVuGeGjuubBE6MP7PvAlBwFlOgt5hG3/Mi/ib6D3wq4MA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=vlp8VNGE;
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FA0D606A6A8
	for <linux-wireless@vger.kernel.org>; Sat, 28 Nov 2026 17:22:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FA0D606A6A8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=vlp8VNGE
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c51d158acc6so296181466b.0
        for <linux-wireless@vger.kernel.org>; Sat, 28 Nov 2026 09:22:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795886545; x=1796491345; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DMbvLhVt9/6Byoyb38QB8bC7RSl2nRVkt3CkxY9/jJY=;
        b=vlp8VNGEYW0LUa1Yv6yQojOikW8OjKUDUaii/i9HxCvyGp8+h4Kgtlgm+qgIKSNIzZ
         UfktPhE4ZYWWh4Qs8vxNJGJg6m2uqm52mIPVzSCeCoOaX0OqSnZ/QZ2aWOHTeVCWTbTf
         xxTXlHjPc7Pre4aiN/qJhkJh+694gaiStDwfy3wIHa4DSjILGS0BK3WhTtmHiNF4k+3Q
         fO5dBt2ekdfEWZ6DTTSSxyo4HfgeqzVGINXZNzDLZed/Pxr59zEYJe/emxw8baElNlAP
         EdndSrs/aSUU5f8VUb1jn0XnrWMd4r+c8QRTFmBDx5Frx8lJaRDJs44fe4a7i2D1bDii
         HDUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795886545; x=1796491345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DMbvLhVt9/6Byoyb38QB8bC7RSl2nRVkt3CkxY9/jJY=;
        b=rSG7ERPhG3aEdk6SGlfh4fuZHR1V5kq2mjkW2nB3UiuRVTVli06V8Pa0kELPmmk4xr
         ZuTE62k7YHb5zNqHPKRefxtvZGL0j0oxD7yVus3gE5co86TeBWqWD/pHVdr6itYn/lAM
         1NYreoj3eJiaojIOOFKm+mbujSLBru8s1aKAWmPDMdlE+kHsHEaHLFSMFd8Hhh+WfkWx
         VtjRNt/01I8sV7Pp2yhgh/F3uyPC3Y5ACS+rHHyKINIDQSfZXbD3A8ntfOS3bsPCH+YW
         Yts4ySrfh33/BONCPSm8hGVN/KDseuY67atT54PhQ8PnxfSPQXgY3SHJs0YPN0bKR1IW
         fhqg==
X-Gm-Message-State: APuU4Z8k0cELIWzyulg9rxTlu/TsGfS8AaTf1D5etUxUHkFv3DSGzNpz
	pU84S55/QojqD+BgxXWWU5fvZm+GbwiVw1TXhrOqpB0ZFuKMGQ6iZPT98zo3DMle2g==
X-Gm-Gg: AZFdTZeZ2X59nZmBDcHTimXYS1Bz72TPO0GMaZzCpBJnthZsej4xAbRg4nv1GezUp5Q
	olaeJlWP7RCsNVLLnC1Qj6OOTpIII2NOprzRxdjXEMWEtKUx5Hg6UThQnZj7S49aEqVI2PieI+d
	WeMIWIHHHxr/kqTvuEl8Mx5MPmnx3oTkYaSRHNBqh6+/TvPgHWHZQWk6ImLIFJMfdXDcJsVKFxQ
	Q20OutJRKtpiaUBF5IE8v5KPLJkdPIah9DxNRubhmqmv4hRbu80TEo9TcD4mQWWlR8Z6JcjVcEz
	mxKvdit68zDi+t93Zc1OSdoRGS5xWxGFh9cnIQGzJ8M1EJxpulAocj29sD4Y1f2HY+V+c21XdU7
	bXtdb3yaIPf3fW9fCFEcESnkHdtPsOuqH3bJxxn/c6TELGtHBndCcdskSMDRpDPiLbgXJXhsIsH
	Z8XZl471GSPGpsS/XH9MWdGG5l06TPSjBWoCuK9T3ekSDOStqCjGfpSngkcSiGdWhpn+I8KeEd0
	oQPGumB9gbBGDBO9qqgqppdL/0nT+pbFmp86NPA80lUu0JPhuQY8VVZ1/qemkCbS9OOtc1Pug9z
	n3G/JyrSEuh3DxbXcBDKWvcahAwv/YlyyGwlvkNg+gmvLFkIRqEwhvktxQT4wgwU+/9I8+kD+gU
	eqqS/vm9Jg0aJa5MCbJWpAplKX9yRHmAwyfU7T6fY01fCu+7NtVHdm4xxshL/opMqGpx7bvlrZF
	Qz6564irtP9iAdfNS8PpfVPRDoXo7R2cuTWwBar39p91+j/5ZAs3CHJergl/eeb05mq4KLXlHWu
	CEznUxuK7NnHCU7H8qYkHU4eb9AtZPNMdFLjwBehcjW3LWZG7g2hxLsCDDbfYp8H+mOrYO3lkZQ
	x3tgGxfeBo5g7A==
X-Received: by 2002:a17:906:9c03:b0:c46:2987:2169 with SMTP id a640c23a62f3a-c513a84c864mr1823750566b.24.1795886545446;
        Sat, 28 Nov 2026 09:22:25 -0800 (PST)
Received: from Desktop.tail070c67.ts.net ([185.152.145.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b00117dsm981388866b.80.2026.11.28.09.22.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 09:22:25 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Karthikeyan Periyasamy <karthikeyan.periyasamy@oss.qualcomm.com>,
	Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
	P Praneesh <praneesh.p@oss.qualcomm.com>,
	Sriram R <sriram.ramachandran@oss.qualcomm.com>,
	Tamizh Chelvam Raja <tamizh.raja@oss.qualcomm.com>,
	Kalle Valo <kvalo@kernel.org>,
	John Crispin <john@phrozen.org>,
	Manikanta Pubbisetty <quic_mpubbise@quicinc.com>,
	Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
	Venkateswara Naralasetty <quic_vnaralas@quicinc.com>,
	Muna Sinada <quic_msinada@quicinc.com>,
	Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>,
	Bhagavathi Perumal S <quic_bperumal@quicinc.com>,
	Wen Gong <quic_wgong@quicinc.com>,
	Balamurugan Selvarajan <quic_bselvara@quicinc.com>,
	Jouni Malinen <quic_jouni@quicinc.com>,
	Ramya Gnanasekar <quic_rgnanase@quicinc.com>,
	Carl Huang <quic_cjhuang@quicinc.com>,
	Maharaja Kennadyrajan <quic_mkenna@quicinc.com>,
	Govindaraj Saminathan <quic_gsamin@quicinc.com>
Subject: [PATCH ath-next v2 6/6] wifi: ath12k: clear RX_FLAG_8023 of the receive status for each MSDU
Date: Sat, 28 Nov 2026 18:22:20 +0100
Message-ID: <20261128172220.922376-7-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261128172220.922376-1-julius@bairaktaris.de>
References: <20261128172220.922376-1-julius@bairaktaris.de>
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

Since commit c4aa897fe234 ("wifi: ath12k: Handle DP_RX_DECAP_TYPE_8023
type in Rx path"), ath12k_dp_rx_h_undecap() sets RX_FLAG_8023 in the
receive status that ath12k_wifi7_dp_rx_process_received_packets()
keeps for all MSDUs of a REO reap. Before, ath12k_dp_rx_deliver_msdu()
set it in the copy it hands to mac80211. Nothing clears it, so every
MSDU after the first one delivered as 802.3 reaches mac80211 with
RX_FLAG_8023, including those that carry an 802.11 header:
ath12k_dp_rx_h_undecap() rebuilds one for EAPOL frames, for decrypted
group-addressed frames and for frames from a 3-address peer with both
DS bits set, and native Wi-Fi decap delivers one.

mac80211 hands such a frame to __ieee80211_rx_handle_8023(), which
drops it when the station has no fast-RX state, as before its 4-way
handshake completes, and otherwise handles it as an Ethernet frame
whose addresses and EtherType are bytes of the 802.11 header. An EAPOL
frame that follows a data frame of any station in the same reap is lost
this way, and so is a decrypted group-addressed frame.

Clear RX_FLAG_8023 with the other per-MPDU flags in
ath12k_wifi7_dp_rx_h_mpdu(), before ath12k_dp_rx_h_undecap() sets it.

Found by an LLM review (Claude) of the code.

Fixes: c4aa897fe234 ("wifi: ath12k: Handle DP_RX_DECAP_TYPE_8023 type in Rx path")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
v2: discovery line reworded.

 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
index e37353445749..b74ffcd94a87 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
@@ -417,7 +417,8 @@ static int ath12k_wifi7_dp_rx_h_mpdu(struct ath12k_pdev_dp *dp_pdev,
 			     RX_FLAG_MMIC_STRIPPED |
 			     RX_FLAG_MIC_STRIPPED |
 			     RX_FLAG_ICV_STRIPPED |
-			     RX_FLAG_PN_VALIDATED);
+			     RX_FLAG_PN_VALIDATED |
+			     RX_FLAG_8023);
 
 	if (err_bitmap & HAL_RX_MPDU_ERR_FCS)
 		rx_status->flag |= RX_FLAG_FAILED_FCS_CRC;
-- 
2.53.0

