Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=77.238.176.206
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794330402;
	b=zmfy0TzaO+NmHM/getTBI9gGWNFJStzP1eobwgqUBG/tzYZZPn126iwpi66wpPVKCWZV
	 v4SSPxNdFX/pXb73FR1nl0omAgr7x+L50W2upPMiX1kpdOIXNJnaFI6LNCNekU+JgRWo7
	 lg0yFFmAD4fp7Xsz9hGETWdjAbd47Hev5590EndsNJW/dhI07aV3a2EsqdmgCRv9ile6g
	 Rvc9b4V0H6pzCkYERH8dcxDj0XV/RCnUxuDdZmdd8XnARGa040MX77ylRDMn/WSQoOMzB
	 xv64/EaRfW16FjtDQqBsB0gx3MuB7QxosmLZcauqHG0ZfZqrFjoPN1vllMht/kEsMbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794330402;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:References;
	bh=NvWpvicabKlZLfiRwbSRPWozusNH6QpWm219PpurJyw=;
	b=TtFpFbKXXCpcvQyNp8A2S4RbO7sRlZsNZUu1aXxLeJJ75ZQClN0g+wFJ36vjauHVHssY
	 bvaIdD087/2sN7WR2gxGo4YFjI2P53J/FgKpm+R+t/cuTOICPaMXmXFRogr7baICTXV8H
	 GWsmDs758NJgsuh9oQ6Sl6qgyGsS1EqevkLSXZa3o7BGHAJpax5OD4Tp8j7ZwxqxyDGbT
	 Y3TSB9cJ4gFCxVR1U4KtlXTBig+C2vMzYve0XNzes13Z/sU7NTSCKn/IrlJgEApgfrRGA
	 IvH3XPjR9cJCM8dzh82qQWIPmECliKF/ao0Yn5v4h3RIHEJyX1npLmRRJuGhKX/uqRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ymail.com;
	spf=pass smtp.mailfrom=ymail.com;
	dkim=pass header.d=ymail.com header.i=@ymail.com header.a=rsa-sha256 header.s=s2048 header.b=TmkL7kDh;
	arc=none smtp.remote-ip=77.238.176.206
Received: from sonic306-20.consmr.mail.ir2.yahoo.com (sonic306-20.consmr.mail.ir2.yahoo.com [77.238.176.206])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F12EC606A31C
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 17:06:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F12EC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ymail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ymail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ymail.com header.i=@ymail.com header.a=rsa-sha256 header.s=s2048 header.b=TmkL7kDh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ymail.com; s=s2048; t=1794330400; bh=NvWpvicabKlZLfiRwbSRPWozusNH6QpWm219PpurJyw=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=TmkL7kDhDxSD6TLzer3zNysH7oj+RCmx9VyRW9C0sXKtAV0NYGstfQ3VwFX33hV46/gGvZ4KUAPDgS/7Qjg/ClQdidxJPbS0GMkXmgTPTl38cCxs/jWf5Q4fB9r1Mmdt67ucpc55Z9dnm/Xf4dRRARMcCUcmB7qv1wlReNk+1Asz3y5bmCE7BeTitsgf2R2oLbNZjI5B/28qvICgq6uoUCx9D+wiN+VZV/s8YZHOVKVHVOKN7yQKhREVt0twmmwnWoBAVkO6mGaVZpWxfyw5TjrwGdmbTrrUiIKI2j4R5VuYtiFCBGwB488TX0QBQHr22hRI1eJzo7TohaqdMgVaNA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1794330400; bh=7wi68EwuwehhM71nwgOuZVXVKdB8qrX/xdmzFhWDxgH=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=KvYgPaRMcqB6o6UMsQaJXkLUTBcxjjQlM59pcMoAn+jyk7ezI+RPE7drXpuWgfjL6hgF0NY1iNZlJWrL/31ZteEo77N4VJ/deQQtybYd8RhKJlv/rw3hi6dnSvbgy02hyCA1O6reIu14oQD3Gd//1KZizx2qG1PeMt+9WZMDpb0ezeYm65nDIzoOBgpLEyMlNdElTvwhjzcCTw4dYBVYW1KOIir73drt8hG5HvA+i77vs7+T/4DFiV3a1FQK4X/Of685kle9ICScsiqlDuh+H04PFk8nU8E/MvWxGH8fDx1/NY7SMS+VstR9+IMMMnEDjqqjSmxk8BGjt7FK0m9Pgg==
X-YMail-OSG: HdnUYZwVM1mXQXJoZKvpLTQdXO83tVOLChqVBwi_t3P84g_i.G9lrKH9oOMMLC0
 dHqaMU_tLyu.4Sgd_o8lnanuxhbeimRlW4T2QiV2G2R2nAFdnfeBInDGLjgaMMWPdu2Cm3dzN9vw
 GFU3oFzXJOrTb3Hi9dehOjaCHEEC0nGaH5RCptMhBxmiV3UP3uVe7fYQ.skz5o54gPMmBhQAxVsa
 zLohhXa9NDieBxDubKIq24IVQm.69JNA_1b_fgWx2SF.EzxmUW4WRQ6ivVq1JGws8NSAd9w8otCR
 HtQSNW9k3kAetgOWUKznXteBrMH6v7fXF2QNMIGMVFE_Mxlv51UsXmvtzrJu3pKZb0TdnflpMrZA
 cnJye3vlR0Sq8wygQ7F7X0tRBACmHOJDdXGYx5EzDmINucd3U3TIghDIrIRDXoFcG8P2DWbDvVTR
 Jjbj0E3ErHiK0eL0y_hl1nptwACmV.cByrNC_Az3fbLInxumEoCZbBk1ieE2AsrFJiKbVCsg0YG3
 9EWy0tS6nbIJFE9D7O5dNFuwfRD1F1ikEp50PtGUp4xhTWa43a92_DNeVPZS12qVgb3nwWrSfaGi
 pyfH.mle.djdOZ2QPkXlIibIag3Mdj4F3iq.O2_JKobpupnnjtblg4TOT6qrpt6HBaB_e.t7qkrm
 vvZx1DDJ9uguT7l68S1bCMNrpVuu5FAtdwUwLxwzMBe01pCCDnGRrP4WnXlfu5F.Fhs7jLe1APWk
 GijTU9seqDLtZ7l8gukWfWrZj4aocS.JTO6UX6WJ6w47wa4zO7QGoOGmQ_knC8zBbCyfz95BHL5u
 6eDTqklLeMkSfFQE7LU361TDBx7apoqo94n_r.zNL4Nfp7BoHKCIDsJMRnR.F5vtTAg1CZb4coug
 W79juaqLpbkN1fbWVpHQoV6QivjwFMF5pZSn.RXPavofe2N_yF55gfGrZzWIPAEAA2jPG7mWh3gi
 eWon5REE0EGvz2yvCW2vXdxImukIgkpwd6AtTAqGIyAvqZKMSPa_SuXX0SYk5CcEfqcExmOFcnmV
 CtW.9xJClQdL92qu.dMgSXnJEgkO6aM2sOa2yj9nmYZ86tLUZMqNR9bjsEApzvHxSj0kkWc2ZHSh
 mS.VsFamqOigCTLwvx_4FfjMidFQT5zRcQyYogYUImPzM452ZaRLFLSZSqlziQde27KQkex1khG.
 czfdzal8Nla2af2G3IC.UCxFiU.e5TdyBKXbjp_jUyddMX6ts11fz.5wNS_vq4HPxsPEbHfkCcFS
 pbv1fzVwnm9QN2j1aKZqM.mbBZaGQBuvMDjFtH7wdBvW8t77lGdCB4iqGiWNUn0jPnq5rGnwD0yo
 4stF.rHNlsbG0XkByvtFa1Abb0XImWvALnXD8sZ8q23K9T_DQguuZojOuFzgecwnXibcQ4Aqi92z
 nKs7BClq4H8sGMANzC4qtr9NSkCV4xA77i7pnhfuYil7YN4lbKk.hAEXQURsb1CHKkhO6TGglax3
 HHs5bkS.G2FD_6svedHtHRXgDhqOCLB11zebwgwNN.2tTBHi246ln8dBgKzzSwtA9aQted9hHeFA
 YbLYv65syw6tFxEhh.Bl_fhmrd_AFlrefNYZbCorhxS2RDCDR9KqHWb3ELc3Sy3pkRvmyn1QqzjD
 DRh1Fx2jl5nWR6a5vlXbIh05sS8CDBIKAqVLVC6GBc2.kPAoR330NL68KJUKCSKMC9TsgkM10dZo
 sPdlGLfuv3TbBo0pFpX6qeYdY6e3bj1hodpVap61Zm1xuzpfyg2kvGYvqf.4pN70IKyH7x4TX8wY
 HowtJz9DGhe.UjfzF.F1foHjHu8ZPcWHtr3w8HXKJV5mnAoa4nNtqpr1UEyL7blmYdT7fYn4TVIf
 Dxobp3N4.ykM0GxpLzs9R_Me0PZkPMZGtRNBYg0tPOf_tI619qVU5m2WILgi8_Hjn98qNakSk91b
 4P7_a2eMMOq2aBbUXi0TMfAW2C.BFmZ9_9LsyDlrhLLaG5WcMtpejbVAoX2vKi8oCM5xANVa7oHH
 0Tsu4Z.MSzafcjHVee74nniHPkVMuDt9nLCw4tVfySIGYtoCRyxzzChwlbPYwrh6woGtDfybkInJ
 y7b9QwdhS3BhusAIzgDGXIyUM.8GMfZeIweQiISYFhS0BzRqt98bkIVZakNCLihJF6iSzKl9u3t6
 i.sS7cF8CloEpdmQkXCDusPITxhuINAZ3dt.7BqIjBawcyZyqqcA8GT8pYDPnIFNHhPKXosJ6GLG
 B.iFq2Cj8LtDPy0iqR0NjzeGm1L5uinDeru3gbWHNh2NPGw23UbFPFu5LMjU3J3EwDrk_1.eI15Q
 1yuXs1jJjrA--
X-Sonic-MF: <dominikengelhardt@ymail.com>
X-Sonic-ID: 1ab11be0-6188-45b6-b460-87bd9e639eb8
Received: from sonic.gate.mail.ne1.yahoo.com by sonic306.consmr.mail.ir2.yahoo.com with HTTP; Tue, 10 Nov 2026 17:06:40 +0000
Received: by hermes--production-ir2-5dd9bf4598-9c455 (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 73cd908788e04c84a33f61bac000e531;
          Tue, 10 Nov 2026 17:06:35 +0000 (UTC)
From: Dominik Engelhardt <dominikengelhardt@ymail.com>
To: =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
Cc: linux-wireless@vger.kernel.org,
	Felix Fietkau <nbd@nbd.name>,
	Dominik Engelhardt <dominikengelhardt@ymail.com>
Subject: [PATCH ath-next] wifi: ath9k: let mac80211 handle filtered non-aggregated frames
Date: Tue, 10 Nov 2026 18:04:59 +0100
Message-ID: <20261110170459.31857-1-dominikengelhardt@ymail.com>
X-Mailer: git-send-email 2.54.0
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
References: <20261110170459.31857-1-dominikengelhardt.ref@ymail.com>

When the hardware returns a frame with ATH9K_TXERR_FILT, ath9k retries
it internally only if it was sent as part of an A-MPDU. All other frames
are completed with IEEE80211_TX_STAT_TX_FILTERED set and left to
mac80211, which buffers them if the station is asleep and retries them
once if it is awake (ieee80211_handle_filtered_frame()).

Since commit d94a461d7a7d ("ath9k: use ieee80211_tx_status_noskb where
possible") this no longer happens. Unless the frame requested a TX
status, ath_tx_status() reports it with ieee80211_tx_status_noskb() and
frees the skb, so mac80211 has nothing to buffer or retry and every
filtered non-aggregated frame is lost.

The filter does not only hit sleeping stations. On AR9561, programming
the TX filter for one sleeping station (ath9k_hw_set_tx_filter()) also
filters the next frame of every other station whose key cache index is
in the same block of eight. An awake station without HT, whose frames
are never aggregated, then loses that frame. On an AP with a few
power-saving clients this caused 45% loss of pings sent once per second
to an 802.11g-only client and TCP connections that stalled for minutes.
HT clients did not suffer because ath9k retries their frames itself.

Report filtered frames with the skb again. mac80211 re-queues such a
frame, so also remove the header padding from it, as is already done
for frames that request a TX status.

Tested on an AR9561 AP (TP-Link Archer C7 v5, OpenWrt 25.12.6, wireless
backports 6.18.55 on kernel 6.12.112) with a client that associates
without HT. Programming the TX filter for an unused key cache index in
the client's block before each ping lost 20 of 20 pings before this
change and 0 of 50 with it, and mac80211's tx_filtered counter now
increases once per filtered frame.

Fixes: d94a461d7a7d ("ath9k: use ieee80211_tx_status_noskb where possible")
Assisted-by: Claude:claude-fable-5-2
Signed-off-by: Dominik Engelhardt <dominikengelhardt@ymail.com>
---
Notes (not part of the commit message):

Test setup: TP-Link Archer C7 v5 as AP (QCA9563 SoC, AR9561 2.4 GHz
radio), OpenWrt 25.12.6, i.e. kernel 6.12.112 with wireless backports
6.18.55. I have not run this on a mainline kernel. It is compile-tested
on ath-next (x86_64, W=1, no new warnings). The OpenWrt SDK build with
only this change reproduces the release ath9k_hw.ko and ath9k_common.ko
bit for bit, so ath9k.ko differs from the release only by this patch.

Reproducer, no second sleeping station needed: write the same values
ath9k_hw_set_tx_filter() writes to AR_D_TXBLK_BASE (0x1038) through the
debugfs regidx/regval files, for an unused key cache index that shares
a block of eight with the target station's index (hw_key_idx in the
mac80211 keys debugfs), then send one frame to the station. I can send
the script.

Results with the filter programmed before every ping:
  non-HT client, before: 0 of 20 pings answered, "TXERR Filtered" +20,
                         mac80211 tx_filtered +0
  non-HT client, after:  50 of 50 answered (56 and 1400 byte payload),
                         "TXERR Filtered" +50, tx_filtered +50
  HT client, before and after: 20 of 20 answered, handled by the
                         existing A-MPDU software retry
With a filter event every 0.5 s during 9000 pings at 10 ms intervals
(1400 byte payload) to the awake non-HT client: no loss, no corrupted
payload, no kernel warnings, memory stable.

What this does not fix: with a client that really is in power save
under sustained traffic (a ping every 20 ms), the filtered frames now
reach mac80211's tx_filtered queue instead of being freed, but loss in
that test was not clearly better (0 to 7.7% per run, against 1.5 to 2.5%
before; the client's sleep pattern varied a lot between runs). I suspect
the re-queued frames end up behind newer frames in the TXQ and are then
dropped by the client's CCMP replay check. If you would rather have
ath9k requeue filtered non-aggregated frames itself, as it does for
A-MPDU subframes, I can look into that.

The AR9561 filter granularity (a block of eight key cache indices
instead of one) looks like a separate issue in ath9k_hw_set_tx_filter()
or the hardware. After writing the filter for one index, reading
0x1038/0x1078/0x10b8/0x10f8 shows all eight bits of its block set. I
have only this one chip to test with and no register documentation, so
I have left it alone.

An LLM (Claude) was used to analyse the problem, write the reproducer
and draft this patch and text. I ran the tests on my own hardware and
have reviewed the change.

 drivers/net/wireless/ath/ath9k/xmit.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath9k/xmit.c b/drivers/net/wireless/ath/ath9k/xmit.c
index 3413bb490..c8b9ef6dd 100644
--- a/drivers/net/wireless/ath/ath9k/xmit.c
+++ b/drivers/net/wireless/ath/ath9k/xmit.c
@@ -92,7 +92,8 @@ static void ath_tx_status(struct ieee80211_hw *hw, struct sk_buff *skb)
 	struct ieee80211_sta *sta = info->status.status_driver_data[0];
 
 	if (info->flags & (IEEE80211_TX_CTL_REQ_TX_STATUS |
-			   IEEE80211_TX_STATUS_EOSP)) {
+			   IEEE80211_TX_STATUS_EOSP |
+			   IEEE80211_TX_STAT_TX_FILTERED)) {
 		ieee80211_tx_status_skb(hw, skb);
 		return;
 	}
@@ -2474,7 +2475,8 @@ static void ath_tx_complete(struct ath_softc *sc, struct sk_buff *skb,
 			tx_info->flags |= IEEE80211_TX_STAT_ACK;
 	}
 
-	if (tx_info->flags & IEEE80211_TX_CTL_REQ_TX_STATUS) {
+	if (tx_info->flags & (IEEE80211_TX_CTL_REQ_TX_STATUS |
+			      IEEE80211_TX_STAT_TX_FILTERED)) {
 		padpos = ieee80211_hdrlen(hdr->frame_control);
 		padsize = padpos & 3;
 		if (padsize && skb->len>padpos+padsize) {

base-commit: d0fbb39d65dc9dcb4175fa6b23e473dec3670f4d
-- 
2.47.3

