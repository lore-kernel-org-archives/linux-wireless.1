Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795381535;
	b=2jXTtXXLBkIhPPGh0DKNXrb4XC2fVWKBRIvGSDAGpmSUACZwFysMwXXBPiExG/JKsIPO
	 YZc+rKGgL87zAmm3xwSyv5BR2oMoXOjMEVnAMAMpd9cv4LaFUGnhf1FBRpbgI3Giv/+aC
	 DY/n82vImTSUCJ41AqAMgdm5nshORtEqOFlXXSTAsQLhGUcCoHZi4HwgyEoiJ86ObI4SH
	 B8pGbsN8ypZ9+MqnSwL3JVVerlhfQ5M51GwiFbNU/WiNDFkHWjFcYjrNjI73q/BBAHo1h
	 wX7j2arhKkuEaQRzNfh9j1FTUzmJ42XLbdctqhTO0So6J0hgcqo4SyhFIUv/9wiJXbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795381535;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZrC17kLP85VhrLnJZWnSDitIpYddK+4irtfGQwA3Jes=;
	b=KcklU4qHW+/h5f4Qu2eLhu6A0f543YrbjFIQLv3ubV81Zuuy6Tl82jjE/5OTZz3JyI2P
	 R3nx25g02+y/sl4T1WDUymxMR3uAv+bta5IqrEmpb6BAMqN03JIIXrnthAGWmQL10Xe8u
	 7QdcLt1/G7oEMWJLzkfFMFu/Lj72puzET/KB1n+7Ngrs6GU8WrYjOUNBNxaWXSydM5i/R
	 0wIkUIPuvblMzcBtDMNa2J9HZTYyeerokF+WTk8KllYmtIrFzbuHEPqN7GspDSkkD15yS
	 WV40M/DzEMYJCMiFtlHUGvfbPVrS6lsM9l6jUgk4/cBY8vm1GRtFJJvmRT84LQ35HMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=HN0ND8QR;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD38606A68C
	for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 21:05:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BD38606A68C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=HN0ND8QR
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c505b2e1cb9so495959166b.2
        for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 13:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795381533; x=1795986333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZrC17kLP85VhrLnJZWnSDitIpYddK+4irtfGQwA3Jes=;
        b=HN0ND8QRSBaFe+F0WIe1MfhEOVdpH7a1/ny4TCw1Zr3RzkpVNbbUM2lQZxFiqXPGlF
         eMR20Ypet8DN2WMRtCuihJN4Fo4uglp3vMxBSLc2x+gsGFMhHOD9YhUHv6lFPfPWuTFQ
         wK6E19ouh5DEjQkdZTVVrV+1jQHflH9xjranXUsrdKFK7L+aoDxYG3LpcxiC/pZCUnvC
         QQv+DbwFpCd0XF835ib6C0FTGEqHMoKKN7iXAhw5Jkz0NOkxSFMLaUHt+B2gc1VKA3n5
         fGEZGbmvQG0ufw7qC+MC5O+qOXVLxVRJAZl/AHiIf/Wd1aIQPbVEjLIh3HX1Rliwh+xK
         fHBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795381533; x=1795986333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZrC17kLP85VhrLnJZWnSDitIpYddK+4irtfGQwA3Jes=;
        b=Ulofp8BfS8UbPERK+yTTtvuINLB/RHliQuv9bdPll2jHm8iF/eTNupLR7PIHx6i+gu
         EgoiZJ0qndX7w69D27F42bcy/sK56y0YiKTgJCTZ1YLHa6C3s1Q8aTa+q1ZbrQ8S90cp
         i/eJg5dIhBUPyxO9oQy+TtybMRz3omYxBornUKFIvgthPkDYZhb4stjXlQ6zMQw517l5
         3kAKw8xLteaWC8vNHqHJjulBDBOTuMVBNFmq+VxyQfQD5pAMYWW4zthtXHKlIxKxm3Dw
         a7S0R00C/KxSTj7qzYBLgO0W/c0VFixV7FDNVjuPoOU+ruYJZIdnvDaWOxxZ5bDa/MyS
         CsKw==
X-Gm-Message-State: APuU4Z/CzfsYUpfMKPRL89820R/Fex0lZKNd1R/g4ZswbSNCcZw+PVUD
	yxjlN96OJ3+qBwO9K61YCKL2iwcFne5BAOn23V7cXILn3C9RUWHwQW/WizaG16UcRQ==
X-Gm-Gg: AZFdTZd/42iLpPhfoaU72S+kgwo9U7XSOHlTGN9ANzDxJKymtiSqGRKDm04XWQrehS6
	W0DVXhpKea1Exopy7rHmHzNxK0+JI+mIq6Gdzmp9ELdc89mmXBAOOnXJto1FvfFuqAM41gEvoz5
	b/XM0KPYITrVifNn2QOOJTEtHXvETohbc5D+feZv4jw7NG0+qr48pB8tJL8B9Ewmxs80RjeKq9M
	LSQsNMjFzu/kPZDiaDStaunrdd1Rn5tXYa5X/0PuRYMCqtmNEhIhVpRYv8L4TqfFgtsYfPpsHN5
	p2CF/4o2C8LZuVHPJSVuvPhZV66strHf1hddTiBaEUupgXBvX926xYc8eA0oOJKd4K1QEmVhiXL
	pjANfw349JYALQ0v36xZzU3KxNzxfqAqkvxo2le84bxyt/piwWRogbf8x07aOv+W7qo/h63QD+/
	9Z9CCnIDujtmrZeaPmKqEWw4JehUxkpgKcWJIsO5Gj0Aca3QYoBOjSpAEDnAsHq+tu7ozt/B6gx
	fbOOstNOB6XAyVZMYAn16Wov13Ns7RteT2drI4T48mr4sKNpH3qyqf/3/0B3u4MPTa0WYW3U3ed
	DJ1BgYK51nCQpDdrcfZq5BQlVUV3YCgEMjYdSIFOhOl6QPI4ONweRJN24qrsEpmEcrOIKrLOPP0
	+yRBPL1LdLEJBkcOfHFR6cTRV+K4FRUyJnLzNtkoPIX1RpuZ2pWV4lgAJ92JbBdDEcgGtd15NJO
	UiWaYZU64egyr+TbJjII++iugVIeSFVq5xDo1B1Jt7030w65C7/cV44KCnsGbbnprq5+ptHf5eE
	gUC9okx+a9Son6s83GjvRg5XpJ+Rwv5o45FVN/VV2Bu+ikNzjLXmP5KHMiSv1L9V+929iak62pc
	zOfUXSn0Pz+Uus6wiwPJQE9s1ItU4yMD8ko/URDqQKi6WuTTvlYOEE59Q3GeD/bX2tOcFTaa3Bg
	=
X-Received: by 2002:a17:907:6e89:b0:c51:59c8:a4ec with SMTP id a640c23a62f3a-c5159c8dc3bmr396957066b.1.1795381533567;
        Sun, 22 Nov 2026 13:05:33 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f24713d300ad8e04c1718a6e78.dip0.t-ipconnect.de. [2003:f2:4713:d300:ad8e:4c1:718a:6e78])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc2455sm339935766b.57.2026.11.22.13.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 13:05:33 -0800 (PST)
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
Subject: [PATCH ath-next 6/6] wifi: ath12k: clear RX_FLAG_8023 of the receive status for each MSDU
Date: Sun, 22 Nov 2026 22:05:25 +0100
Message-ID: <20261122210525.2076058-7-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122210525.2076058-1-julius@bairaktaris.de>
References: <20261122210525.2076058-1-julius@bairaktaris.de>
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

Found by reading the code with an AI review tool.

Fixes: c4aa897fe234 ("wifi: ath12k: Handle DP_RX_DECAP_TYPE_8023 type in Rx path")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
index fac60041d3ec..1d52eab418a1 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
@@ -414,7 +414,8 @@ static int ath12k_wifi7_dp_rx_h_mpdu(struct ath12k_pdev_dp *dp_pdev,
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

