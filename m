Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795381532;
	b=NO3aip7UvSTfOtiwO/QniuYXG2r9jppiTgRBiyEAZN62oYCkX8u9gaeD5GAtxsi+7Z8f
	 zJNq2tkwCysZpVoraQBkLSs1FzFmLyuf8gfzc90ZCLJCtMwf7tTfgKagsHfGHwS9CjpN5
	 b6L6Om+UMeZ/vvuVyZlhusUkwEa8YODasMvO8loxDotmiO7NTE9edW2JNAxGQc2xjuwnc
	 1e/r4iU2RyPL+i3KfWZI7VTgW5AWmoe92aL58QCAnhwY/qRzUdmJlCTzySAmROHJ3BKO4
	 lGduKKJ3iGX+/Y4GvifAT6LJqPxzypWmRq+aR8jNKGN2iVJ0YEps0r236O2uBV3/zFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795381532;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RhXLVgSRZBr+TZ8HYB6abPUQ+n+l05u+js/LeXBMczM=;
	b=elE82waYgJ08/U0ZR8kX03S/hG86iKji57GPDWcucsjK/hn5rXDYb2FT+jLnP28W/qkM
	 qwnxgSVpXO7bgx9MOOASNISQgq0LMQy+9+uSUn4/R7pYEhMmP+vjhdRUGwHYvi3V+irNH
	 KGZnAMxGQ+q1FDatXvQuVGKRKDUf4hKo8m8exJjTtzErL7DpSYdh6BgHHf04UF0dafajK
	 lwqWJzR7zcwCbYZRh2VRZLvvmIZKE7zIwGOzNmgM0TdAANdxnEYcvfWl12iFh9gtBTWAy
	 6S1RL6UdXxpzmvw926U1LHZplBWhPc98zkAr92xZdvWmWiiyghqoP1sTnUdRgef4zxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=wOYHaZRS;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB0E606A693
	for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 21:05:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFB0E606A693
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=wOYHaZRS
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c516a160d24so87629566b.2
        for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 13:05:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795381530; x=1795986330; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RhXLVgSRZBr+TZ8HYB6abPUQ+n+l05u+js/LeXBMczM=;
        b=wOYHaZRS3HslOW76vk6PNpFluea0dyW546sBvu6wsCaNn9t24i1HTo4F3AZ1u44Trm
         YgU58WLrEMLorgFWwdT3KVo7eANT46K58R7OLG9YgXB+5hlcVRQBFBJD13KF5jcOprmb
         jjZvDb3PO42X8fXv1Hloa+Qunof9wzQxfPiTf/yo7gtmrOQ/Xl57aET5qLPBjxRCH+bT
         VEx838FJTfsYaou8Z0d3JxE+iuqie2mjrvE/oz77sIcbC0YDlnXzqUN9xb6zHC8Kh0aQ
         Ip0ZMw54tuJAaPpd+ZZYrbbftcqmMdqbii00X0VYGkPe7COJAsGOhpnAt7G4F8I8VanS
         8+zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795381530; x=1795986330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RhXLVgSRZBr+TZ8HYB6abPUQ+n+l05u+js/LeXBMczM=;
        b=lruiBgzDKLRGkiMOpzxT7ZYFdd52ULv9Gl+NkkHalFWOFCEOs9rUxBjjDbQeMHQhNQ
         ImyxqALYuo46M7lbAu8G4Yc6GQMLLdtVTaz6bc0HADKPVuBBeqqoY+ZFW1Zk3twuS8xu
         8CrPYqcPVldzrgqy1lXuu7KIuJoMVNASTpnM+xAx9oLnk6pqKuJTF4qfOwOCqehlsuUN
         hutxibwb2MtPcx8cfAy+QeRRWmtUgpvXIgoO6gC94pxgH2++/jDzu9XljonlSFvyyV13
         TBDrtaevl2kMQgd7+cwXEGFzEmt/2ChpL3vHZh0GR/XkZmPPP7OIrbEfgM/2GOgLBmwC
         SyOw==
X-Gm-Message-State: APuU4Z+cgYsGbdAOvMqI6sqbHG8XIjtqysR56098Tg5PZp3zGtC1uAlD
	bLsQ05uj4YwofMafqq81SGehZOQL9PpdAJtLUoZJAguu4pCSNcaKF53XxdnygG+rKg==
X-Gm-Gg: AZFdTZe50ZOe3igRnzbdElh48HKyA05n7mIhC9+gKVf85M4Zy76cDWJpA/5C51f6M1u
	cXMwq78rIma88KVkZI+KFyvfc1KGlZyVlLdyXTtTjdRRZXt3Kxy71jT8aFIjvKNT6BgTKXi8B07
	FQFSX2E5nJBcg1/6hp5ALiUlrPGWiA8AuVJ3lcKNxOl44NDauWUDuVtHJBM4BSwWoN/TyOy0KvD
	DWMkZPWmQINiIwcIXsWbUH8ixPVLwXfv4iIOjiT2gNgtIr06/1KA8vGlS6F/QnYScEoK5AE8EVc
	aSis82KFhVE7VEe4shvkt9isQXCJpaWxjl8Xo5OjULlrDuEsUxVIApLViuQT6WnJlWbOqNz0b2t
	yQe0P2DS6+Tchq+V0mxBwrpNWGG9gfQoxf/xp91wYf0xLsgb/Jt4KuJoAayXeAOmmZEEoLjlAjV
	ZTjLXocuWMTnTecN+Ew+DVQWM7i4efv4fP3kAGy2Ny0m49vLPpbyRPmV/SmejRRPvPIzACViy9A
	vgiM/uEjHHtObLk1LM0uan/oECqZqDcUWscxslgmnWOgb425bwCzab4O85uyHXdMQPFgb0I8BNG
	vpsZJh+Q4H+whH+qoGFsMU6V7giea1wtVhoatqA8+KqyzD2wnnhIUuWXmM4t2Q6ehlG6Kolo69s
	pxp9roOTdoZoUDojQ6RC6dud2GQDd119cs6qbfH4Cp4nFF5PmBfRl8mu/5A7QtlO+2psMC6F9RX
	EoZgevbfgl84fzUbcijhG9xf2aO3QveaSn0i9TGy6ClAaL6wBmgQccSC2u8yAX+aU+/MMIjiQAt
	iql25WZA84rYwBe5rWHVvOnvsg78MCafgtxA7kB6SkUfz9yUFYKPGbq2HdkBEqehbbCLydn7vAK
	yAH5lGjEqjymIsxjGWYZ7t61kk3D9Q2Rk0pezvpR4yJ9JtwsmDXAITnIqwaSvKWZ6rGUTVT22Q=
	=
X-Received: by 2002:a17:906:af85:b0:c3f:dce3:20c5 with SMTP id a640c23a62f3a-c513ac496d8mr571307066b.44.1795381530146;
        Sun, 22 Nov 2026 13:05:30 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f24713d300ad8e04c1718a6e78.dip0.t-ipconnect.de. [2003:f2:4713:d300:ad8e:4c1:718a:6e78])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc2455sm339935766b.57.2026.11.22.13.05.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 13:05:29 -0800 (PST)
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
Subject: [PATCH ath-next 4/6] wifi: ath11k: clear the crypto flags of the receive status for each MSDU
Date: Sun, 22 Nov 2026 22:05:23 +0100
Message-ID: <20261122210525.2076058-5-julius@bairaktaris.de>
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

ath11k_dp_rx_process_received_packets() keeps one ieee80211_rx_status
for all MSDUs of a radio that a REO reap returns, and
ath11k_dp_rx_h_mpdu() fills it for each of them. It clears
RX_FLAG_DECRYPTED, RX_FLAG_IV_STRIPPED and RX_FLAG_MMIC_STRIPPED of the
MSDU before, but not the other flags it sets for a decrypted MSDU:
RX_FLAG_MIC_STRIPPED and RX_FLAG_ICV_STRIPPED for a group-addressed
one, RX_FLAG_PN_VALIDATED for a unicast one.

A decrypted group-addressed MSDU that follows a decrypted unicast MSDU
of the same radio in one reap would therefore reach mac80211 with
RX_FLAG_PN_VALIDATED, although the hardware checks the PN of unicast
frames only. ieee80211_crypto_ccmp_decrypt() and
ieee80211_crypto_gcmp_decrypt() then skip the replay check of the
group key.

On IPQ8074 hw2.0 with WLAN.HK.2.12-01460 this is not reachable: the
firmware releases group-addressed MSDUs through the REO error path,
with error code DESC_ADDR_ZERO, and ath11k_dp_rx_wbm_err() gives each
of them a receive status of its own, so no reap carries the flags of a
unicast MSDU into a group-addressed one. An ath11k station under
unicast load received 29011 group-addressed MSDUs there, and none of
them entered ath11k_dp_rx_h_mpdu() with RX_FLAG_PN_VALIDATED already
set. If a chip or firmware delivers group-addressed MSDUs through the
REO destination ring, a radio in range that recorded a group-addressed
data frame of the network could send it again, without any key, while
the receiver gets unicast data, and the station or mesh point would
accept the copy.

Clear the three flags with the other per-MPDU flags.

Found by reading the code with an AI review tool.

Fixes: 2167fa606c0f ("ath11k: Add support for RX decapsulation offload")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index f8c08b8b6b08..6fdcd2aed7dc 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -2338,7 +2338,10 @@ static int ath11k_dp_rx_h_mpdu(struct ath11k *ar,
 			     RX_FLAG_MMIC_ERROR |
 			     RX_FLAG_DECRYPTED |
 			     RX_FLAG_IV_STRIPPED |
-			     RX_FLAG_MMIC_STRIPPED);
+			     RX_FLAG_MMIC_STRIPPED |
+			     RX_FLAG_MIC_STRIPPED |
+			     RX_FLAG_ICV_STRIPPED |
+			     RX_FLAG_PN_VALIDATED);
 
 	if (err_bitmap & DP_RX_MPDU_ERR_FCS)
 		rx_status->flag |= RX_FLAG_FAILED_FCS_CRC;
-- 
2.53.0

