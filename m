Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793986539;
	b=NZMSf505ByiWtWnj/NnjI3E/YlVtDDdSV+OhhHMCoQ6+c4s8uJ/BQP2pBsTWXhi5KLKL
	 C99z0JgWlov2lczEpRDstuWAl4UQxsATkzE+DhG+XLZqDfYQqXEIc71wllajWJh3Vi27l
	 lyDsTwaxV2mgS3sJeqB4JX8PLeflwNOipUL3FTZBg7LF8zJSQDr9JXypSSyF0piBUQov7
	 /dzzzrU3n9oAanHCpensQPYMF2UO9eTlw4qhYkvB8sGGoveErkbxk7vsldXdD7jkPggED
	 aqEPB5+R/EP44aCTvnGCl0GuaJFzqMhlQ0SCcfWxrjUFlunFl+4Rye6FtiZfXijDGoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793986539;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:MIME-Version:Date:Content-Type:
	 Content-Transfer-Encoding:From:Message-ID:TLS-Required:Subject:To:Cc:
	 In-Reply-To:References;
	bh=9h1qWQSo2bfZtMhtQwi2j+0baKULX5LG8qfPi6Czi9Q=;
	b=T/+wZ6z3w+pzFXxVLSKvN6fY1FGp9lnlMYADVu9+LZ77CaceXaCkMQUCzDZfcrDRAsXW
	 4rqGQu5FjkeiBfjpG/5jnXu1j49N0M5U20cRkNRQWmdQyrqNhvfDQD3Faqk5nZovRQmWE
	 UJdpdvF9rdLMAH8t8LFdEyJwERgR/1NrWoI1DdxAiyshSxAZh4Jo0gshX1z2nO1SjFqag
	 9gLwNGtBymINe1ohXUUGYxDrT1ZbWGQm7hTTPO0V518Jp8P+iW1RELtKagIM+qK/m82tX
	 HjwUCyTR6YxMdxec5PcmfTOvdgs+zhCrjAMcGcwkXQZeugPBhSjutgIYUuiFJ+CHodA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=AMxBG5qY;
	arc=none smtp.remote-ip=91.218.175.3
Received: from mta0.migadu.com (out-3.mta0.migadu.com [91.218.175.3])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38852606A329
	for <linux-wireless@vger.kernel.org>; Fri,  6 Nov 2026 17:35:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38852606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=AMxBG5qY
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=UAw4luFEqDTEvPhZffw7Um2r/LrzYhDoiu6+Pdiro9g=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793986536; v=1; x=1794591336;
 b=AMxBG5qYefDXYmV8Taz0ZvkqTBoiNBx2tuqIWfSJYkNV/YJP8ePwbv0m8qmLVpAvjyMrAZ/Y
 SY8s80xa7tx20wcduFYkLT+hHrFb6xpJuL8pYvlyAiqWbjdQL6I3J101aYXFsy9cJMQNUrrG3dx
 VI+i0lklHnMhx1TMAhB2vllw=
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id df4875bbaf29c7f8;
	Fri, 06 Nov 2026 17:35:24 +0000
X-Mizu-Trace-ID: df4875bbaf29c7f8
X-Migadu-Flow: FLOW_OUT
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Fri, 06 Nov 2026 17:35:23 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Luka Gejak" <luka.gejak@linux.dev>
Message-ID: <ada56d168f44385c12672eee9f4a750716e6de67@linux.dev>
TLS-Required: No
Subject: Re: [PATCH rtw-next v2 7/7] wifi: rtw88: 8812a, 8821a: respect peer
 A-MPDU size limits
To: "Ho Jie Feng" <hjf3108@gmail.com>, "Ping-Ke Shih" <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org, "Ho Jie Feng" <hjf3108@gmail.com>,
 linux-kernel@vger.kernel.org
In-Reply-To: <20261031070950.425176-8-hjf3108@gmail.com>
References: <20261031070950.425176-1-hjf3108@gmail.com>
 <20261031070950.425176-8-hjf3108@gmail.com>

Hi Jie Feng,

Two small comments below.

October 31, 2026 at 8:09 AM, "Ho Jie Feng" <hjf3108@gmail.com> wrote:

> diff --git a/drivers/net/wireless/realtek/rtw88/rtw8821a.c b/drivers/ne=
t/wireless/realtek/rtw88/rtw8821a.c
> index f7391f6aa3039c7ba4d88249d968a5f1763ea866..f597edec290f64fda1c4578=
12b240515360dc387 100644
> --- a/drivers/net/wireless/realtek/rtw88/rtw8821a.c
> +++ b/drivers/net/wireless/realtek/rtw88/rtw8821a.c
> @@ -49,6 +49,13 @@ static void rtw8821a_cfg_ldo25(struct rtw_dev *rtwde=
v, bool enable)
>  {
>  }
>
> +static void rtw8821a_set_ampdu_factor(struct rtw_dev *rtwdev, u8 facto=
r)
> +{
> +     factor =3D min_t(u8, factor, IEEE80211_HT_MAX_AMPDU_64K);

For a VHT peer rtw_set_ampdu_factor() passes the VHT exponent here, so
IEEE80211_VHT_MAX_AMPDU_64K would match the 8812a version. It is the
same value, so this is only about readability.

> +
> +     rtw_write32(rtwdev, REG_AMPDU_MAX_LENGTH, (8192 << factor) - 1);
> +}

This is the same as rtw8812a_set_ampdu_factor() apart from the limit.
Maybe a single rtw88xxa_set_ampdu_factor() that picks the limit by chip
id, like rtw88xxa_set_crystal_cap() in patch 5 does for the mask?

Best regards,
Luka Gejak
