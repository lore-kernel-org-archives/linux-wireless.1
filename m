Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795643572;
	b=IvuoCIVvDejYyGk9K9KycuZ3V4HFm/ySUv+au9ioEorrWrx2UtapJTBvtQIBPsEsQ+Xw
	 LgVpJWdINEpqNJgRwVJVIfMrJORyOqwSKa6BRfch8wKOdG/LIXXpd932GngyagndcqJ1H
	 Lq0bZESzH4ndz/5CGA4wKhg1v0WRtEkRoJogoc7xn7Oy8btU2FqhtW1+B5dNDZ4sumuXp
	 42JvoQ1Rku0TD+e1l0GcOluRdq8Ws5JLeVrp+2vE/zCCZPLdvnzVY3yYL0sEW3953h7NI
	 4o5qYGCUKoTz2rfaLbpdnITBs7q/VVRhldFxcOFk2w65G5HGbIp6cTIv7Loo58JgiLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795643572;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=GVCyVBHEyPwpCZP8IHFkxXH3jvABv960i5mpTHWKRuU=;
	b=EaSgJZ69jRrOFrXRJ4YUm0YA4tvoJpleHHTmVYei3yr7k8WCpev6BqozsB+MuM0deuGE
	 +9Cp2XtznPVHzoHVd9+BsT7MFZe3VppiQt587oSUPCl/IB0mJ3C73BhAEAkeufwHGu3Sh
	 cD2JRDcKVBh1Wi6bjf48tJqRdvlky+6faRTQTYzqhfyrYYBVXlLrOpFmF/xgjrJGFYPfG
	 CHGIgCGxIK8+3J5IVySY5JbcG3aABB05E5eQsPbLDkL9phS7jv9OhN830bUSoxa/Mu4VA
	 T69bh0VZbrIrfSg/P5wv5S5qT/qWJHpPaPpgacDSAHuoSxUR2ImrOATMcwCsLvC+F0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=UhKz7HzW;
	arc=none smtp.remote-ip=95.215.58.116
Received: from mta1.migadu.com (out-116.mta1.migadu.com [95.215.58.116])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46342606A321
	for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 21:52:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46342606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=UhKz7HzW
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=+K5rktOKhzXVrAEMyS2KlecObNiWyKea3xmY2a7ZZYc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795643569; v=1; x=1796248369;
 b=UhKz7HzWeIXzaS8LNul/sTt344y66N34ftMPbdi1fzFuSHpKXCCQA88FUdOhHezwg5c/KQ7r
 2gbUQ23C4GzIx47bEXDrRd6VpryhJ8smqfJf/U08oBPMShMb2Krx5vqb+TY6/8q3FNppPlc5FYQ
 hZ5sjpOVow/MzqnmSSP9xWRU=
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 7727b47d71f378be;
	Wed, 25 Nov 2026 21:52:49 +0000
X-Mizu-Trace-ID: 7727b47d71f378be
X-Migadu-Flow: FLOW_OUT
Date: Wed, 25 Nov 2026 22:52:48 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: niko3x@proton.me,
 Ahmet Zeren via B4 Relay <devnull+niko3x.proton.me@kernel.org>,
 Ping-Ke Shih <pkshih@realtek.com>
CC: linux-wireless@vger.kernel.org, Bitterblue Smith <rtl8821cerfe2@gmail.com>,
 linux-kernel@vger.kernel.org, Ahmet Zeren <niko3x@proton.me>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_RFT_rtw-next_2/2=5D_wifi=3A_rtw88=3A_honou?=
 =?US-ASCII?Q?r_the_retry_count_and_NO=5FACK_of_injected_frames?=
In-Reply-To: <20261124-b4-rtw88-inject-v1-2-f7457e496924@proton.me>
References: <20261124-b4-rtw88-inject-v1-0-f7457e496924@proton.me> <20261124-b4-rtw88-inject-v1-2-f7457e496924@proton.me>
Message-ID: <7904907C-A864-4DE9-AE9B-65082A38B29B@linux.dev>
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

Hi Ahmet,

I have two comments for patch 2 as well.

On November 24, 2026 11:32:31 AM GMT+03:00, Ahmet Zeren
<niko3x@proton.me> wrote:

[ ... ]
>       info = IEEE80211_SKB_CB(skb);
>       ieee80211_tx_info_clear_status(info);
> +     if (info->flags & IEEE80211_TX_CTL_NO_ACK)
> +             info->flags |= IEEE80211_TX_STAT_NOACK_TRANSMITTED;
>       if (acked)
>               info->flags |= IEEE80211_TX_STAT_ACK;

As far as I can see, a successful report for a group addressed frame
sets both flags. The zero CCX status means the transmission succeeded,
so for these frames it does not imply an ACK. Could we reserve
IEEE80211_TX_STAT_ACK for frames that expect an ACK and use the CCX result
to decide whether a NO_ACK frame was transmitted?

[ ... ]
> +     if (info->flags & IEEE80211_TX_CTL_NO_ACK) {
> +             pkt_info->rty_lmt_en = true;
> +             pkt_info->data_rty_lmt = 0;
> +     } else if (rate->count) {
> +             pkt_info->rty_lmt_en = true;
> +             pkt_info->data_rty_lmt = rate->count - 1;
> +     }
> +
>       if (!(info->control.flags & IEEE80211_TX_CTRL_RATE_INJECT))
>               return;

So if I read the parser right, it clears IEEE80211_TX_CTRL_RATE_INJECT
when the requested rate is unsupported but still fills in rate->count.
For example, if I replay a capture with a two stream VHT rate on a one
stream adapter, we keep the usual rate selection but limit the frame to
one attempt when the capture has no retry field.

Could we gate the rate->count case on IEEE80211_TX_CTRL_RATE_INJECT as
well, like rtl8xxxu does? The NO_ACK case can still apply without a rate.

Best regards,
Luka Gejak
