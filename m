Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795132282;
	b=V1Va203VxzohfExMJzFcdUsnRdC3xINJfLQBzt660uXsZeKlJUeix42mEzRogpOO0Faw
	 o069pKWp5Xpi5xb0z0uuMTwK5+NWpV4WrTe38rfcE9fbrHMYSZB/nrbMPDIynXdzwLUSA
	 VOzW7d0uPxJsB4I26TKy0DIbR/lPKUEshDEWIT6/62J808tGFTiVatM0GzhLvnCdyDeW7
	 6bpVM1jhvc0iCXUoc7cFKc3GFXCH5xp1RitesjAwh39WVfYbmYLFJuk/rnAm5L8mbEr+n
	 HhtLUyT5BCZT9yz/tG0EH1KVmGSwxgOB2Hvhd2n1V7aM2Ml1flrU8NS8c1GqR+d8e5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795132282;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=C8ADdYonZWrL091y2jSjEEH2R/PyNmllYhkBRfpcpWo=;
	b=rSjoWk9bGPyjbDDfZDjKwKXUOil5a4pzVaUsy+qxoupwU9/P08m0o/FJr8U+IA1FO58b
	 X898sISNoS4bB2rHEk3oSswdc2u+HE6xIQFeijNi34H5k0YB1NRxzNT7Fe1onVZIDiQEV
	 9DE4v2mT6UyMCHNUv67/mz7aXTw3UzPuEoHl/ITww0s1znqTmhBrL5fz0cUI2LPbxV46r
	 5Np7+i47r6gPiFhivH73qSkJDahWJ1HiVBoLlZQaYIVzUvG+oiOZjf9JWQSN0k1ynYsPx
	 QnoUL/0SKHlzyskm8deJ9+mWPqpAsk0eb1tJR30TjyiXIKfYPXNEQZjeh6anNvHcS8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=morsemicro.com;
	spf=pass smtp.mailfrom=morsemicro.com;
	dkim=pass header.d=morsemicro-com.20260707.gappssmtp.com header.i=@morsemicro-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Co9TRkul;
	arc=none smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACAFB606A325
	for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 23:51:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACAFB606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=morsemicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=morsemicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=morsemicro-com.20260707.gappssmtp.com header.i=@morsemicro-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Co9TRkul
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8b2382bf051so229465b3a.3
        for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 15:51:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=morsemicro-com.20260707.gappssmtp.com; s=20260707; t=1795132281; x=1795737081; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C8ADdYonZWrL091y2jSjEEH2R/PyNmllYhkBRfpcpWo=;
        b=Co9TRkulxAgfAFWFJH8dH9X5VDp9mOl5BXJxhWBtgwzuf0nMx3ED9GImbLxhU+4+Zs
         jE5G//vdFQolfdoPjMlZbjGqT9mm8aakSBQdeXZ5Jsi6LfxwYbjw68VoJbrromP8EvP+
         WSQtVmyDFdfG2Qyepw+GAo+ZS1ETp7zho8JdhtisRmDseVSO3/M/Tz2ehb6WM2+7D+Ar
         3Uiy6ubTAM+bMtop5BPvxHPutQ1LBT13c2aL8rerimuJEK409eWM4hAKDvWR/XivBRPF
         EPI5oXwxf6LSW7GEcdkB1AAPKjXkjENtYSa0gvYofAFfodKJ4FNu43LXeXV+dLcFhHvm
         KdUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795132281; x=1795737081;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C8ADdYonZWrL091y2jSjEEH2R/PyNmllYhkBRfpcpWo=;
        b=vJswwVvdHYZ5J1u0iT2Nz4VRDo3v5hkBJuwcS02P89dTUnau0LjXxRyCAQAvdDFOvk
         nmy96z0aYUed4N9f4I852xSdEf3WQVlDI7xc13Rh9GNpHxVsegibQBkgfzqWNcIqvoFY
         l/CcBZATi0b4/J/6EfosKwkUM42EGcJQte9AeTxmCxPz5zbWUkv+q0T+eLv51QqxUwvK
         o0iMgbZ3AwXxQyUFGNZy3XeHS5skvmzuGi2Fyr8r0zkSRGKJKnIL+fc4+cx4ufmKo1oT
         B4+fKZZb8cRX/bFnArX51otmHIeS9kLV/ITZPT6NSzk20WsVwmXAVXGqXZe4mDJxQyZ4
         sHnA==
X-Forwarded-Encrypted: i=1; AL+hErG0kxJQdXM6fZbPOtuFMszAnWCFR8hBoS1AmCIywzquK1OB/HylEiACrX4HT1tWtCHd2Nfi21Wc44aiy9EQDQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+B8q2AdvslDUaJHGAr8e5QGoVgKPGhBDMN8uPyjIoVihgi5y8w
	5DoTFJLgeCi85RBYJfbvFqSY3j3m5dNYoLYnNGk1wUKXlTKIvs8gkEKk9/nCD/b7Ez4=
X-Gm-Gg: AYBFou38I0hRwXCyDUF+0Wt3zsvgyYTPm/pUrjqwq66mnoaw8ZWGtXo8tTtboc6039k
	CoS1FYJ/lMqpfT3aw2X0c4RUW7zNIsZMHrF/KD8tAw9QJlGS91sjEqBrUsDrEx1arg9NDzYZpVH
	GJ0e9LYsT54WoRmzBCjExvLDrW71Pis8PnC3nrxeDc6vkuik0Jjn3OmnFyWSBRElgJS/5YdyUi/
	j5uKZbF2/zR7eYn0hZi0tyd/ZyD5xw0TlVDYT8G1/KW5Zj0xjPvMtfeW5Tg1Y3Jq4srK8mqd7Qp
	Nj+1JhIhHIK3yximH40jel4vpNkJ/yEKcFPQ2+NMUsrHTG2dC+lgJKN9SqELkhwWAh7M9GZGvwK
	81xnaxtrpf4v4P8NhkuhobgjVfxvU9AhdbsSZ7pL07ukp+o+TdyGo6YKpRS76PE8m+iVx4XzR8J
	5UUdmjRBq6B6jcVAXPd92IeZ4653wTQW+YbYS6hLbSda77+0KJratuAgGlXeQlYAsE3J+Gt2TV/
	dnbC+JrU05AKzC56pH5azKV/0nOFVc5ju+Qu1ikWs+6FBbpYGiDgoYGMfJJF/PN5EHv+dixsJAG
	8EjleF3+xAmnHpTf2V8pB3ViyhQx0ZY3m6aHciwNdQ3QZ7ObExj0m9awsV4lxmgxZjs+zOZ9q24
	ZoyXC+hyegdOzyUs3D7ZDY/Xy3Es=
X-Received: by 2002:a05:6a00:600a:b0:8b6:594d:7031 with SMTP id d2e1a72fcca58-8c87d51edf1mr1113785b3a.59.1795132280946;
        Thu, 19 Nov 2026 15:51:20 -0800 (PST)
Received: from localhost (60-242-93-14.static.tpgi.com.au. [60.242.93.14])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873f11da2sm549456b3a.55.2026.11.19.15.51.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 15:51:20 -0800 (PST)
Date: Fri, 20 Nov 2026 10:51:15 +1100
From: Lachlan Hodges <lachlan.hodges@morsemicro.com>
To: Linmao Li <lilinmao@kylinos.cn>
Cc: Dan Callaghan <dan.callaghan@morsemicro.com>, 
	Arien Judge <arien.judge@morsemicro.com>, Johannes Berg <johannes@sipsolutions.net>, 
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH wireless-next 3/4] wifi: mm81x: bound the .fw_info TLV
 walk
Message-ID: <god7c5ejpf3edqwnsrhtg3oi4mdfdsrgjze72c32dp3hxxk4pv@qqfc2soc42br>
References: <20260812060740.1275280-1-lilinmao@kylinos.cn>
 <20260812060740.1275280-4-lilinmao@kylinos.cn>
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260812060740.1275280-4-lilinmao@kylinos.cn>

On Wed, Aug 12, 2026 at 02:07:39PM +0800, Linmao Li wrote:
> mm81x_fw_parse_info() only checks that a TLV header starts before the
> end of the section, so a header that straddles the end is read anyway,
> and MM81X_FW_INFO_TLV_BCF_ADDR reads its four-byte value without looking
> at the TLV length at all.  The BCF address can come from whatever
> follows the section.
> 
> Walk by remaining length, and only take the address when the value is
> really there.

Can you rebase 3 & 4 of this set on mm81x-next [1], they no longer
apply as a new new TLVs were added. I applied 1 & 2 a while ago.

[1] https://github.com/MorseMicro/linux-wireless/

pw-bot: cr
