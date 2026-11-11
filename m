Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=158.120.87.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794412756;
	b=FYJ2QvpatTHvT8qnW4V0qOF6T72lKHdu/YQcE1BYSzcyVXQadCgF/9q1u1LvVQdJkNF/
	 EdhqicAifDK0Bd2+NS2g60CVnVxDsjf9rrC4qTu3CJxdezNhfkJFfcs0JF/I5VvetqaYe
	 STlAow6E04bosnp8Z/2vVw8ZyIwVfjY7Hr9qytgAb+ck+B8g8y8uvPHCKrjaLgKij6VCJ
	 RKE/qq8RkAxv+oWaX5lUFz4mtUu8krEjOFy9GLhV6YRxIv4TIsrE8nS787Cugr435i1zT
	 VsdCIJCqa4pdXTQQ7JvFgQOiEhFZ83wGqxKmPCUUNQs51rcRVfql0Ah2VQ4+BLdHoRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794412756;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Content-Type:
	 Content-Transfer-Encoding:Mime-Version:Subject:Message-Id:Date:Cc:To:
	 X-Mailer:X-Last-TLS-Session-Version:X-Report-Abuse:Feedback-ID:
	 X-smtpcorp-track;
	bh=3G7sxB9iALR3LRJJmCy7M6iGVc1JIdlX+fZL73CRsfk=;
	b=yiNfcMcg1PxyysYLV91lFCDdor/iP1VBmWPnjGa0oamqAmTEyad/9X2KqdAPRzMVXQYB
	 T3avEveeyJBoopPbfF0PkojNjji6JVQ1AVcmrpZixq1t4bEUoLJexF+I3nIpQWhFwmJ5n
	 x1e3jjVuuYJiq3aOI55IUOdHwHhE/Bd6BM/10jd/aT0NTm6T5DEb2pS0tHC1HnSfpTVR3
	 FJKAbFlsJJqQ7fKIGz1fa56VrEbAVNKYitj9Azhpt8iaVwXudNddGrHVNO0uyAx4W/e/s
	 /AyiXHArGQwyo2Skn1Y4KH3yqvs8iztpo7AukA53qeuAWAHFQYRbY1onshbQ08tJWeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=domov.de;
	spf=pass smtp.mailfrom=em697561.domov.de;
	dkim=pass header.d=domov.de header.i=@domov.de header.a=rsa-sha256 header.s=s697561 header.b=HG5Ynp9r;
	arc=none smtp.remote-ip=158.120.87.53
Received: from e3i821.smtp2go.com (e3i821.smtp2go.com [158.120.87.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7051D606A32A
	for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 15:59:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7051D606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=domov.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em697561.domov.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=domov.de header.i=@domov.de header.a=rsa-sha256 header.s=s697561 header.b=HG5Ynp9r
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=domov.de;
 i=@domov.de; q=dns/txt; s=s697561; t=1794412746; h=from : subject : to
 : message-id : date : list-unsubscribe : list-unsubscribe-post;
 bh=3G7sxB9iALR3LRJJmCy7M6iGVc1JIdlX+fZL73CRsfk=;
 b=HG5Ynp9rLo/6MCHIJEf1rJc4kdV/xgMOYvMkqYUkcDBftyG2zwKGT3+MsHG5KfwJ/efwR
 QH4LHnQduqLJc+DbwPD9eRLYpD5sWAcKIn/u/taX+nm1tj5WjDplFgC4DQw/0b//9CJOtA8
 BEpaAlNL6Y7eVcYKeCIrgwBnxJY5ziZkQXvJcVC7wuQUJQeADVAJa8rmYEGf51GrP2Q+++F
 l5G5GNSA4i1xGkSuJ5w/kKmwVSFc42HgIkAHjosyXHfIUZc8LcQhEVmO9onuT1/BpyNGvUn
 SC9yUIUnA5//jYIfoJqQnejpT7CgepNKREIbSMrnRnzKTlM5clNaMreuEs3Q==
Received: from [10.240.241.197] (helo=mail.domov.de)
	by smtpcorp.com with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256:X25519)
	(Exim 4.100.1)
	(envelope-from <ath11k@domov.de>)
	id 1xRAiy-AIkwcC8qpPG-Hzrs;
	Wed, 11 Nov 2026 15:59:02 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C2BC543E53;
	Wed, 11 Nov 2026 16:58:59 +0100 (CET)
From: Andreas Ufert <ath11k@domov.de>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.700.51.1.1\))
Subject: ath11k: 802.11s peer stuck at 1 MPDU per PPDU until DELBA  (IPQ8074,
 WLAN.HK.2.9.0.1-02146)
Message-Id: <47133D6D-8DEF-42DB-A432-095B8DDF0974@domov.de>
Date: Wed, 11 Nov 2026 16:58:48 +0100
Cc: linux-wireless@vger.kernel.org
To: ath11k@lists.infradead.org
X-Mailer: Apple Mail (2.3864.700.51.1.1)
X-Last-TLS-Session-Version: TLSv1.2
X-Report-Abuse: Please forward a copy of this message, including all headers, to <abuse-report@smtp2go.com>
Feedback-ID: 697561m:697561a_MogmP:697561s5momUP_Z-
X-smtpcorp-track: BhZcX-dwQk6u.2BDcCoKkVsOX.QvJkzwTJqUy

Hello,

on a three-node 802.11s mesh of Linksys MX4200 v1 (IPQ8074) single
directions of mesh links repeatedly drop to about 30 Mbit/s while
the air link looks fine. In that state the sender transmits one MPDU
per PPDU towards that peer. A DELBA for TID 0 sent by the receiver
cleared it immediately. I would like to know whether this is known,
and what data would help to find the cause.

A note on how this was analysed: I am an embedded Linux engineer, but
not a wireless or ath11k developer, and I do not have the detailed
knowledge of 802.11 aggregation and this driver that the analysis
needs. I relied heavily on an AI assistant (Claude) for the analysis
and for drafting this mail. The assistant also ran most of the
commands on my nodes, with my approval for each step. The numbers
below are taken from raw command output. The interpretation is the
assistant's and mine, and it may be wrong in ways I cannot judge
myself. Please correct me where it does not make sense.

Setup
-----
- 3x Linksys MX4200 v1 (IPQ8074, AHB only), OpenWrt 25.12.6,
  Linux 6.12.112, ath11k from backports-6.18.55,
  firmware WLAN.HK.2.9.0.1-02146.
- Mesh backhaul on the 5 GHz radio: 802.11s with SAE, channel 100,
  HE80, 4x4. Node R is the router, nodes A and B are bridged APs.
  All three nodes peer directly with each other (one hop each).
- The ath11k modules carry two out-of-tree patches from OpenWrt
  PR #24254 (make external IRQ control idempotent, private page frag
  caches for rxdma), which fix a memory leak on these devices. I do
  not think they are involved (see below), but the modules are not
  stock.
- The fix for the wrong TID in ath11k_dp_rx_ampdu_stop() is present
  in this source.

Symptom
-------
- One or more directions drop to 15-43 Mbit/s (iperf3, TCP) with
  almost no TCP retransmits. The reported TX bitrate stays at
  1441-1730 Mbit/s. The other directions keep 190-670 Mbit/s.
- No ath11k errors in dmesg, no firmware crash, memory and CPU
  normal, no radar events.
- Once a direction is in this state, it stays there until something
  intervenes (about 6 hours on 10 Nov; on 4 Nov probably at least
  24 hours, judging from the "tx failed" counters).

Occurrences (CET)
-----------------
- 4 Nov: traffic from both other nodes towards node A, after 4.9
  days of uptime. Cleared by a power cycle of A.
- 8 Nov, about 21:30: all four directions towards A and B. Cleared
  by "wifi down; wifi up" on B and then on A.
- 8 Nov, 22:23: only A -> B, within 40 minutes of the radio restart
  on A. That direction had not been measured after the restart, so
  it may never have cleared. Cleared by "iw dev mesh0 station del"
  on both ends.
- 10 Nov, between 00:17 and 01:00: A -> R and B -> R, 33 hours
  after these peer links were last rebuilt. A probe at 00:17 was
  still healthy, then the mesh was idle until an hourly ZFS
  replication from a NAS behind A to a NAS behind R started at
  01:00. It only got about 16 Mbit/s. Nothing in the logs or dmesg,
  no re-peering, no reboot. Cleared by a DELBA, see below.
- 11 Nov, between 12:17 and 13:17 (probably by 12:42, when A sent a
  flat 31-32 Mbit/s towards R for three minutes): again A -> R and
  B -> R, 62 hours after these peer links were last rebuilt. This
  time there was no "tx failed" burst before the onset, only small
  ones under load afterwards. Nothing in the logs or dmesg, no
  re-peering, no reboot. Cleared by a DELBA again.

Relation to load: the replication runs every hour. On 9 Nov it ran
24 times over the healthy link without a single "tx failed" burst,
and at 00:00 on 10 Nov it pushed 340-360 Mbit/s A -> R for four
minutes without errors. Once the link was slow, every hourly run
produced a burst of 400-4100 "tx failed" in a few minutes, and the
NAS lost DNS replies (its resolver is R). The sender's peer stats
show ttl_removed_count 7353 of dropped_count 8037, so I read these
bursts as frames expiring in the queue of a slow link, i.e. a
consequence, not the cause. On 8 Nov the slow state also became
visible at the start of an hourly replication (21:00), and at 00:00
on 8 Nov there was a burst at the start of the nightly replication.
On 11 Nov there was no "tx failed" burst before the onset at all.
Whether the start of a traffic burst after an idle period triggers
the state, I do not know yet; I plan to test that.

Firmware counters
-----------------
htt_stats type 1 on the sender, delta over 8 s of iperf3 each:

  date    sender->peer   Mbit/s   MPDUs  PPDUs  MPDU/PPDU  MSDU/MPDU
  8 Nov   A->B  sick         33   22938  23429       1.0        1.0
  8 Nov   A->R  healthy     640  152014   8756      17.4        2.9
  10 Nov  A->R  sick         33   24005  24316       1.0        1.0
  10 Nov  A->B  healthy     642  152814   9429      16.2        2.9
  10 Nov  B->R  sick         29   19938  20481       0.97       1.0
  10 Nov  B->A  healthy     636  150772   8441      17.9        2.9
  11 Nov  A->R  sick         33   23976  24384       0.98       1.0
  11 Nov  A->B  healthy     642  156222   8978      17.4        2.8
  11 Nov  B->R  sick         28   16473  15786       1.04       1.2
  11 Nov  B->A  healthy     645  153378   8692      17.6        2.9

(PPDUs = num_data_ppdus_tried_ota, MPDUs = mpdu_count_tqm,
MSDUs = msdu_count_tqm.) tx_xretry over the same runs on 10 Nov:
A->R 1216, A->B 470, B->R 3465, B->A 686; on 11 Nov: A->R 1426,
A->B 656, B->R 2691, B->A 658.

On the receiver R (types 2 and 10, during A -> R): 26995 PPDUs
received, 26877 MPDUs with FCS ok, 132 with FCS error, almost all at
HE-MCS 7, 3 SS, 80 MHz. So the air link is clean and only
aggregation is missing. On 11 Nov the same picture: from A 24685
PPDUs, 24565 MPDUs FCS ok, 123 FCS errors; from B 21141, 20996, 149.

Before the cure, agg_status showed an active RX BA session for TID 0
on all peers, sick and healthy alike. It does not show the window
size. On 11 Nov the line for TID 0 on R read "RX 1, DTKN 0x01,
SSN 0x000" for both sick peers, before and after the cure alike.

The sender's htt_peer_stats do show a difference, in tid_flags of
HTT_TX_TID_STATS_V1_TLV (11 Nov, read without load):

  sender  peer  TID  sick state   after DELBA on TID 0
  A       R     0    0x1014000    0x101400c
  A       R     1    0x1014000    0x1014000  (TID 1 not touched yet)
  B       R     0    0x1014000    0x101400c
  B       R     1    0x1014000    0x1014000  (TID 1 not touched yet)
  A       B     0    0x101400c    0x101400c  (healthy)
  B       A     0    0x101400c    0x101400c  (healthy)
  R       A, B  0    0x101400c    -          (healthy)

So on both sick links bits 0x4 and 0x8 of tid_flags were clear for
TID 0, they were set on every healthy link, and they came back
exactly for the TID that got the DELBA.

I then used this as a prediction for TID 1 (best effort traffic on
TID 0 was healthy again by then). iperf3 with --tos 0x20 (AC_BK,
TID 1), 8 s each:

  A -> R  TID 1  32.7 Mbit/s   (TID 0 on the same link: 655)
  B -> R  TID 1  31.0 Mbit/s
  "rx stop 1" on R for A only
  A -> R  TID 1   630 Mbit/s,  tid_flags 0x1014000 -> 0x101400c
  B -> R  TID 1  67.2 Mbit/s   (control, still slow)
  "rx stop 1" on R for B
  B -> R  TID 1   513 Mbit/s,  tid_flags 0x101400c

Afterwards all TIDs 0 and 1 on all links read 0x101400c at idle.
So in this occurrence every TID with clear 0xc bits was slow, and a
DELBA for exactly that TID fixed both the throughput and the flags.
Bit 0x1 and bit 0x4000 changed right after load (e.g. 0x101400d,
0x1010001), so I only compare bits 0x4 and 0x8, read at idle.
A TID that had never carried traffic (TID 3 from A to B) also read
0x1014000, so the bits seem to say "aggregation set up" rather than
"healthy". I do not know their real meaning; my guess is the TX
aggregation state of the TID in the sender's firmware.

On 10 Nov the sender's htt_peer_stats for R showed dropped_count
8037 and ttl_removed_count 7353, which matches the "tx failed"
bursts of that night.

What cleared it
---------------
On 10 Nov, on the receiver R only:

  echo "rx stop 0" > \
  /sys/kernel/debug/ieee80211/phyX/netdev:mesh0/stations/<A>/agg_status

mac80211 tears down the RX BA session for TID 0 and sends a DELBA
(reason 3). A -> R went from 33 to 675 Mbit/s immediately, without a
peer rebuild. B -> R, left alone as a control, stayed at 30 Mbit/s
until I did the same for B; then 541 Mbit/s. Afterwards all six
directions ran at 516-654 Mbit/s. On 11 Nov it worked the same way
on both peers (A -> R 30 -> 663 Mbit/s, B -> R as control stayed at
29 until its own DELBA); afterwards all six directions ran at
518-656 Mbit/s. That makes two occurrences cured this way.

Earlier cures: "wifi down; wifi up" on a node, or "iw dev mesh0
station del" on both ends (the nodes re-peer after 75-90 s). On one
end only, station del did not help: the peer did not come back and
traffic took the two-hop path (single test).

My reading (not verified)
-------------------------
- The state belongs to the BA agreement of one peer and TID, not to
  a device: sick and healthy peers coexist on the same radio, in
  both TX and RX roles, and renegotiating the agreement clears it.
  This is also why I doubt that the two memory patches are involved.
- Because the DELBA ends the session on both sides, I cannot tell
  whether the receiver side or the sender's firmware was stuck. That
  two senders failed towards the same receiver in the same minute
  (10 Nov) and again within the same hour (11 Nov), and on 8 Nov
  all directions towards two receivers, points to the receiver, but
  that is an inference. On 10 Nov B sent almost nothing at 01:00,
  yet B -> R was slow as well.
  The tid_flags above show that the sender's firmware itself has
  the TID in a different state, while mac80211 on the receiver
  still shows an active session. What brought it there, I cannot
  see.
- The "tx failed" bursts follow the slow state under load (see
  above). One burst on 7 Nov (1089 frames at about 2 Mbit/s
  average) does not fit this and is unexplained.

Questions
---------
1. Is this known, on IPQ8074 or other ath11k devices, in mesh or in
   AP/STA mode?
2. TX aggregation is handled by the firmware (ampdu_action returns
   -EOPNOTSUPP for TX). What could make the sender fall back to
   single MPDUs while the BA session still looks active on the
   receiver? For example a stuck TX BA state in the sender's
   firmware, the REO queue window of that TID on the receiver, or
   BlockAcks the sender does not accept. Could the (re)setup of a BA
   session at the start of a traffic burst after an idle period end
   up in such a state?
3. What do bits 0x4 and 0x8 of tid_flags in
   HTT_TX_TID_STATS_V1_TLV mean? If they are the TX aggregation
   state, could they serve as a load-free check for this condition?
4. What data would help most next time, before the DELBA? Is there a
   way to read the REO queue window or the BA state per TID, or a
   debug_mask that logs it?
5. Would it be reasonable for my monitoring to send this DELBA
   automatically when a link is slow, or would that hide something
   that should be fixed in the driver or firmware?
6. Are there relevant 802.11s or aggregation changes in firmware
   versions after 2.9.0.1-02146, so that testing a newer one would
   be worthwhile on this hardware?

I have full htt_stats dumps (types 1-25) and htt_peer_stats of all
three nodes from the sick state and can send them on request.

Thanks,
Andreas Ufert

