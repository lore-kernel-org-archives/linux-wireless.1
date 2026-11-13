Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=158.120.87.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794563894;
	b=Ae1hDH7bFEtKIBs5/kyKFLnBfy4DuUAcFtZxgpxzCcJcaiMWYIjcSAQQ1yifY1NGTFj1
	 uao41HcKe7ImxBHtjGR0/qW9MkvuDLe84jkMjtlKKBJq4+PcSyYQ7tRxBOA3EZM3QbFWm
	 lZX9THyVq+JZFk+tQc2UxrMCcxaiHo/XQej6F3NdTfSbbD5OxmMxPcVHkLPExNKPbU+4X
	 Z3wCK9pcmppXFUDUdxLpMCezhJ0e60XLVAMYzGl58DbRCPmCQK/fzi1H0NoG/Beul7FQW
	 a0RlqUSkFZ4ZGgMvyjfnbQY7BoJb+GO4FhIYMVua4oJgKX+fcFfkNiQXGjPiEybn/OA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794563894;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Content-Type:
	 Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Content-Transfer-Encoding:Message-Id:References:To:X-Mailer:
	 X-Last-TLS-Session-Version:X-Report-Abuse:Feedback-ID:
	 X-smtpcorp-track;
	bh=mZONIYnW8+Xtz/W7yL4lA48kSuBOoYRJ/ql3Y9SPYbc=;
	b=rj6PnTB+I4n0LUNKVgGFwojIC5lr/HMtigfI0edjZOh9vpxAX9OWi4rw52QKiz7HGFIZ
	 iDS7pP2V7qhBCJSmGqefc98FFH3JtgkNvfiDkkseAIPpt8lL63GiFFgG+issG7dWeBZj/
	 KMb5EJ75LLcbQwMx2OyiIlMLqx3hGbYGj6uEDU1OQGbLzJswg2bJDsF2Jy12wO6n7C5Vv
	 YSRH9ehaT2dq3h3DDSlttC8gKcM+GgzAYVk+nT2fmvvb1FWF/jHj0Ax2U8+U5vC5VCg5f
	 b7oRgxw5Y87DZRjABnsBRBLyFrxEwdIajaxGYfOnAyuXDN4Y+4VJwXyMD6OdJGmg3mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=domov.de;
	spf=pass smtp.mailfrom=em697561.domov.de;
	dkim=pass header.d=domov.de header.i=@domov.de header.a=rsa-sha256 header.s=s697561 header.b=RHr9dSkU;
	arc=none smtp.remote-ip=158.120.87.56
Received: from e3i824.smtp2go.com (e3i824.smtp2go.com [158.120.87.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C460A606A321
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 09:58:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C460A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=domov.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em697561.domov.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=domov.de header.i=@domov.de header.a=rsa-sha256 header.s=s697561 header.b=RHr9dSkU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=domov.de;
 i=@domov.de; q=dns/txt; s=s697561; t=1794550843; h=from : subject : to
 : message-id : date : list-unsubscribe : list-unsubscribe-post;
 bh=mZONIYnW8+Xtz/W7yL4lA48kSuBOoYRJ/ql3Y9SPYbc=;
 b=RHr9dSkUB6TGARM+1GEt1ssgsW42rxDJuEp38JQUrnC011w3oaygJIKhcsV7k0hQjMkyc
 QO65SPuNRTSHQG786KPX6WZ6U8y3WaxX/dl4UhzwYdVYY9b5fNebV6gocmAuM7mDQVygc6i
 f3WU2ei27WVE4CULJtxzZkklJ+jywjP4vf/URGZ9pGQgDYy28rs5n77bG09U92rzTINMAYn
 FwuIPP57OqgcHi89L0vMTaxoLHTNZL08ZLzwEfZX5RxW6lk3CCRKGFhv/MznXzS6uqzlMel
 Uu4K0Pe6tF90vPxOLt9pSeraU62AwLnFSaibVUx2hcpe49Y4Cdw7GtCARxWA==
Received: from [10.240.241.197] (helo=mail.domov.de)
	by smtpcorp.com with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256:X25519)
	(Exim 4.100.1)
	(envelope-from <ath11k@domov.de>)
	id 1xRkeN-4o5NDgrnoqH-o3yR;
	Fri, 13 Nov 2026 06:20:39 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1F7BE44001;
	Fri, 13 Nov 2026 07:20:36 +0100 (CET)
Content-Type: text/plain;
	charset=us-ascii
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.700.51.1.1\))
Subject: Re: ath11k: 802.11s peer stuck at 1 MPDU per PPDU until DELBA 
 (IPQ8074, WLAN.HK.2.9.0.1-02146)
From: Andreas Ufert <ath11k@domov.de>
In-Reply-To: <47133D6D-8DEF-42DB-A432-095B8DDF0974@domov.de>
Date: Fri, 13 Nov 2026 07:20:25 +0100
Cc: linux-wireless@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <C98FFCD8-EEAE-4355-BF18-0FE86D3D623A@domov.de>
References: <47133D6D-8DEF-42DB-A432-095B8DDF0974@domov.de>
To: ath11k@lists.infradead.org
X-Mailer: Apple Mail (2.3864.700.51.1.1)
X-Last-TLS-Session-Version: TLSv1.2
X-Report-Abuse: Please forward a copy of this message, including all headers, to <abuse-report@smtp2go.com>
Feedback-ID: 697561m:697561a_MogmP:697561sOu6w9NKWM
X-smtpcorp-track: iSItO6OVgbzY.pinAMDuvoJk0.H5ipwgrvWaf

Hello,

a short follow-up with one more occurrence, this time on TID 7, and
the first one caught by the tid_flags check from my first mail.

After that mail I added a per-minute check that reads tid_flags
(HTT_TX_TID_STATS_V1_TLV) for every peer and TID 0-7 and alerts
when bits 0x4 and 0x8 go from set to clear for three minutes.

13 Nov, 00:30 CET: the check fired for TID 7 on A -> R and B -> R,
in the same minute. TIDs 0 and 1 stayed set on all links, and an
hourly iperf3 probe (TID 0) was healthy all night, so without the
check this would have gone unnoticed. At the onset there was no
"tx failed" burst, nothing in the logs or dmesg, no re-peering, no
reboot. Mesh traffic per node around 00:30: A sent 15-54 Mbit/s
(destination and TID not recorded), B less than 1.2 Mbit/s, R 2-8.
So, as on 10 Nov, a sender that was almost idle went into the state
in the same minute as the other one.

Measured at 06:41, 8 s of iperf3 each, htt_stats type 1 on the
sender, TID 7 via --tos 0xE0:

  sender->peer  TID  Mbit/s   MPDUs  PPDUs  MPDU/PPDU  MSDU/MPDU
  A->R          7      29.7   21728  21828       0.99       1.03
  A->R          0       550  131434   8022      16.4        2.91
  B->R          7      23.2   14646  15063       0.97       1.12
  B->R          0       407  142674   5705      25.0        1.97

tx_xretry over the same runs: A->R TID 7 2311, TID 0 495; B->R
TID 7 5199, TID 0 1053. On R (type 2, during the TID 7 runs): from A
22011 PPDUs, 22300 MPDUs FCS ok, 83 FCS errors; from B 17921, 18015,
243. Again a clean air link without aggregation.

tid_flags for TID 7 to R read 0x1014000 on both senders, all other
TIDs in use 0x101400c. On B it read 0x1014800 once at idle before
the load runs; I have not seen bit 0x800 before. The load did not
change the flags. agg_status on R showed TID 7 as "RX 1, DTKN 0x01,
SSN 0x000" for both peers, the same as on healthy TIDs.

Cure at 06:42:51, on R, both peers at once (no control this time):

  echo "rx stop 7" > .../stations/<A>/agg_status
  echo "rx stop 7" > .../stations/<B>/agg_status

Afterwards TID 7: A -> R 683 Mbit/s, B -> R 372 Mbit/s, tid_flags
0x101400c on both. Right after the DELBA and before the next TID 7
traffic the check still saw the bits clear on B for one more
minute, which fits the reading "aggregation set up" rather than
"healthy".

So far:
- the state has hit TIDs 0, 1 and 7, always per peer and TID;
- twice now (10 Nov and 13 Nov) two senders towards R went into it
  in the same minute, one of them almost idle;
- each time a DELBA for that TID from the receiver cleared it (three
  occurrences, eight peer/TID pairs);
- it lasted about six hours this time, until I intervened.

Full dumps from before and after the cure are available on request.

Thanks,
Andreas Ufert
