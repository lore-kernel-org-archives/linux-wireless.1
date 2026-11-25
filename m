Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.27
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795646337;
	b=A3zwD5Uqv6TtQbRajqEvT9h90kcvRWLwwUI6u8NetNeRp6y3ywtlJqc66yeKLBI57e5o
	 GeljXXRvDkIKGFZwyD1IXzsGL/Gh+LFyfGwoshqTQCuTVwqjt6fgIJwJpH6rd2g1D/WPY
	 bOFD5F8YcYehlGMzNzh4KsUO3thwmScZ12UQtLcyPMpbr2EB1P4Ud8RJDjWsEV9Oe7lfz
	 8RcxlQ37UcZ1LulI5v9WTGfFi7HIF63AJuDVEtkk/WsBm6zFR0CRH24l+4FyvtuRKqqx3
	 2KlOrHB2xQ1V7d51ktpwenT+QgKbIe/iXGKL7HrG+CVfwljn2Q7qwMq0VHecLWkVN9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795646337;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=yuesQr0hGH3vocSCjBCILwvIRFmh4lrrA65bcdf9LH8=;
	b=E1eWlTprE3MgZDyQFnHh/iGSmf+GJ4u8d4umi4U/wixsb5JECdLD95VVIC3qa5B8A/Fa
	 8gG8uMG27DW0KEvh2wXZcW1WxEhLobdQ9HAeRV8e1A0b7MhtspZDJJNp/As7hLliluNM2
	 0CYAhKOAzkHp9JEClGPDOP971qJ8KE1/qGuMSXf97a6d0Ms0jC5IHnaFbH62ZDHNOLnG9
	 biRDUMZ2+ttvcDxPRMF4LaeSH/fvmUWM5OBajQN+85ZbI4RehoZfOxL8kjB8vSHLT4y3F
	 PbDsL8wvF6dIdsAGByXk3fKQnryBiSpul1mDDXcLVvSRm+yvo7SH+DHtTwR5DLsi0Yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=ly9EbpnJ;
	arc=none smtp.remote-ip=109.224.244.27
Received: from mail-24427.protonmail.ch (mail-24427.protonmail.ch [109.224.244.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31EBE606A31E;
	Wed, 25 Nov 2026 22:38:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31EBE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=ly9EbpnJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1795646335; x=1795905535;
	bh=yuesQr0hGH3vocSCjBCILwvIRFmh4lrrA65bcdf9LH8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=ly9EbpnJx2Fvc9SXtP8580MW9zfBZP+T0p5NzdBCbmLm4A+67ESDRKDiIwJ9NkCDz
	 Bl7RyfD8JTQLO9ZeUNX7bvABCh51CkTS+NLAdGv4f88kYNJc3PosvHD8FTHG181PMB
	 0b9W/HPZXPQ44XM4Lb8EqJlX3r+nlyzPltSWfGZhiv8aCvEQrHN3xKULEMS5sy0mMr
	 eCWfX8DsVZ/B/xDzZhObKA4Bmz+B+zTSpWN+U/muiYH4edq8wGeb5N+42N+oJwXBno
	 rNntZ5fQ9F6V/ARSXktahh/uV4jwiwGmp240ed0jzHg+RAOEnz2/WruniOrWdaFyvM
	 P9qkhUOHRWd9g==
Date: Wed, 25 Nov 2026 22:38:51 +0000
To: Luka Gejak <luka.gejak@linux.dev>
From: Ahmet Zeren <niko3x@proton.me>
Cc: Ahmet Zeren via B4 Relay <devnull+niko3x.proton.me@kernel.org>, Ping-Ke Shih <pkshih@realtek.com>, linux-wireless@vger.kernel.org, Bitterblue Smith <rtl8821cerfe2@gmail.com>, linux-kernel@vger.kernel.org, "owner@ph4ntom-rev.uz" <owner@ph4ntom-rev.uz>
Subject: Re: [PATCH RFT rtw-next 2/2] wifi: rtw88: honour the retry count and NO_ACK of injected frames
Message-ID: <Qmyu_zaapR7fisQhYB1W9CDM3OG849otNXR4xWRbIaRocvy40VyY4N2Jte4IHqD33nCI_txHle2bL5F7S0b6Bv_uXvCyk9MJ35CFHWzopyE=@proton.me>
In-Reply-To: <7904907C-A864-4DE9-AE9B-65082A38B29B@linux.dev>
References: <20261124-b4-rtw88-inject-v1-0-f7457e496924@proton.me> <20261124-b4-rtw88-inject-v1-2-f7457e496924@proton.me> <7904907C-A864-4DE9-AE9B-65082A38B29B@linux.dev>
Feedback-ID: 201311995:user:proton
X-Pm-Message-ID: a0fda5cb7a3c21538a50958e206eb1ca9bd17f2e
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Luka,

You're right on both points, thanks. I'll fix them in v2: the retry
count will only be used when IEEE80211_TX_CTRL_RATE_INJECT is set, and
the TX report will set IEEE80211_TX_STAT_NOACK_TRANSMITTED instead of
IEEE80211_TX_STAT_ACK for NO_ACK frames that were sent.

Both came from following the rtw89 change, commit 92608bb5f14f ("wifi:
rtw89: honor ASSIGN_SEQ, retries, and NO_ACK for injected frames"), so
rtw89 has the same two issues:

- rtw89_core_tx_update_injection() uses control.rates[0].count without
  checking IEEE80211_TX_CTRL_RATE_INJECT
- rtw89_tx_rpt_tx_status() sets IEEE80211_TX_STAT_NOACK_TRANSMITTED and
  then also IEEE80211_TX_STAT_ACK when the frame was sent

There is a third one there: max_rate_tries is set to
RTW89_TX_DATA_CNT_LMT_MAX (63), but control.rates[].count is only 5 bits
wide (IEEE80211_MAX_TX_RETRY is 31), so radiotap retry counts above 30
wrap around. My rtl8xxxu patch has the same overflow, I'll send a fix
for it.

Enver, Cc'ing you since it's your patch. I can send fixes for rtw89 as
well if you prefer, but I have no rtw89 hardware to test them.

Thanks,
Ahmet



Sent with Proton Mail secure email.
