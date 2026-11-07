Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794026726;
	b=dqjuonDKi1Id/1rLJJNZdHY3ihRlW+PL5HfRiXh1GmhakFNF2uvYtZk+rw/NCYiYgyG+
	 rVTb2tdtmF2Jw3PkXlS5sZdMwIlLdpYPn4oXJOVyDaLnIAikDjHHHreu5SMxZwbtunUIv
	 skmmK4pKZ2U/XoUIdQjjfQ8X2cMqmPOGI32Zh5NoA3Lz2umvE3opqVGtYbLCdp4SWqvbv
	 ctfFRjEibPStnzhlhzn6f01fdV0ZKX1NpAuPBTD9T05hlzB91myavFry125rvvzEIUDRw
	 EtxHOJn3LjKFLvuVJWTb8houAQIlQgXZuNWbJjKBPDvDMrOaqYi6oj0NTMWJtIWlgTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794026726;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=4l141NEs5t/YzP56LwE7AWpoNvMLitV5XEf2zw+EmM0=;
	b=tV4MF9p3OzLeL+dB2Tp3MfsY0OrhWod/E3OfX7MjN9+jz4i+NSysCxpHKdfEksEH42bc
	 tYD3h1jnZ/FB4/eioT5yhUPOBiI4QZR+R+jDeXt4/05KZTF0FawQVwPrQF4/m4KMyKPAa
	 zZPCr9/g72w9D7WQhrNvrYs1gNv9aJ9nsbV6bw2693psmVTEkpt4ksJHxXwMOM5by0f6K
	 FHAXEnwg30zPH9xxaYHQ6gkt5ytX7JZjU2EjEQI0NjwnLCgr8ToUtLVsrTqomFWxz7SX8
	 NxPEdif1DVJTQ8IFBB+3RD/Vfr1kHKmQMXRxHFRyseXsaKmFOEZanyPQAo19wKgQ7Pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n4B5Jn5Q;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB4E606A32C
	for <linux-wireless@vger.kernel.org>; Sat,  7 Nov 2026 04:45:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FB4E606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n4B5Jn5Q
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1ae18eb9ad0so1812144c88.1
        for <linux-wireless@vger.kernel.org>; Fri, 06 Nov 2026 20:45:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794026725; x=1794631525; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4l141NEs5t/YzP56LwE7AWpoNvMLitV5XEf2zw+EmM0=;
        b=n4B5Jn5QKoj0fYSwGQ+a8qP4Mgi9pcWowfafX2UM5qlTIrHsTlBdGl3JUDqMkOPTxi
         AcCn1kjFriNZM1E9UziIvG3Aca/GldL0sc5TeqorxTu1Ewm5j72d71X5fiMH5reI5jqx
         NY8ZglTkr6/9HmQKE2lzDn2c5uqaMSWMaKxV2RayiYIJGx0GLXGDev6+Ghfmd1dWduuU
         adO93IKivmxje6zfBDToW3sjOEEJv82az8ri0Cg/H5DcS7Vkp4dBOve0A1ukg18qurh1
         79EVCZ6rODgWe+lFBBaNm3upX12sxE+ypKaJSox74OPzq8CxNBSBOCu70aBE5RyiC6wz
         WMjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794026725; x=1794631525;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4l141NEs5t/YzP56LwE7AWpoNvMLitV5XEf2zw+EmM0=;
        b=RyWs0PR4t5Ggq2T6OZeVDjBEEL25RwS02ywpVilfqoihmxujRXP1toI0U1TSoHNl10
         lLkOCdkL3TjhNWN84jxRdGvLfERorc8GdPbu5N4WHJa9PoqIT35zQDx5qJZu/AhraNl0
         LiSamvwE75HPf07pgDiV1u4jAAe2MIvBGltvQgqOatQV/RUUxHupVoK60zuTjB9U4Azt
         AgVmEdx7R5OUordPsnvwnPGkQ4pPzjyPox0CFMMLkLw5s1/6l++l/F8LcH7gM8XjrS/a
         /gIjy8rACy59Ixy+OJERD6yvmVzu+QiimtXfNr3MeJYolDKQ20ILYCpROyqx9OsoSd+f
         49oQ==
X-Gm-Message-State: APuU4Z++Aa6KNYDyzN46AfG/pZlHTFUo4xpXsTrm+xNE+r99ZMFOBEcq
	la67fzLWeJ/U7LU9TzB3s8lMrHesCELuTjqrqArJizMjA6U0Qc+ESeLEdqcg7nze
X-Gm-Gg: AYBFou3d1vd7S25ANMBDO+cRfs4ppn9OHi8zZbMS7zJO5gDWbTGz9VQ7UJwbpUBOHgu
	Uxte2tEie0PRcYeVHTeMFk0i83QfxqeiOvaPEdRuyDSml0JGwOgCWyjNAtMpx90QSUfgfMZyhx9
	OfHuHBcMa6YBTn/4WdO/OQgdqn6oY94PzTUDOSLZwuUhsTJmdQszGdZ3eO4iN87+A9sIhrmBs8b
	3k88eypwPkC0Aa9UVmZDQCnLWegUyVTBvDJ7H4RAFHeJ+3ARkWdPwzxSv3Bxs17+DIMU6bFERZ0
	Fng3DTCjdsnv6s+8NaQO5Of0eyaYONucvK030txxBDiBGPdF8tP6s1UGCkRfao5YH32onU2hFUZ
	VGCh+kIZgfF7eMopKecHfDb9E6pJEDhU7jLUyxmBxhJS8+TrR/t6SVRl+KQnwd0HupjxIsFYgxv
	XHDlJ7uI6cOu+96qPNUGuzoMfYdDejNLylb8XysLEOgH/D+8OWEgzgzXrnvIeljyaY3PVUuCIuo
	0D6Cumlf84Ynj/xAKBQXVKbajO6IkWAsM1ajiCzpXtWt84UdVxU+ewAz4xEV9x0xToCBis5qm6w
	xweKNAPbNxOiyztB5WlUKirFQXaVXq0d1tjVxD0BfYtEWYn2Lt6IKKzI5L0=
X-Received: by 2002:a05:701a:c90a:b0:185:33ab:4d55 with SMTP id a92af1059eb24-1b25d344605mr5370932c88.29.1794026725005;
        Fri, 06 Nov 2026 20:45:25 -0800 (PST)
Received: from [127.0.1.1] (59-127-145-64.hinet-ip.hinet.net. [59.127.145.64])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4f03f5sm10257101c88.21.2026.11.06.20.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 20:45:24 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 03/30] wifi: mt76: correctly set more-data flag on PS
 release
From: Zhi-Jun You <hujy652@gmail.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, 
 =?utf-8?q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>, 
 Johannes Berg <johannes.berg@intel.com>
In-Reply-To: <20261102203831.1058362-35-johannes@sipsolutions.net>
References: <20261102203831.1058362-32-johannes@sipsolutions.net>
 <20261102203831.1058362-35-johannes@sipsolutions.net>
Date: Sat, 07 Nov 2026 12:45:17 +0800
Message-Id: <179402671716.27949.5626612001892590656.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794026723; l=521;
 i=hujy652@gmail.com; s=20261026; h=from:subject:message-id;
 bh=uxWGhyVprf49x8SyUTzyh1luVn5uwqKOLLIqbLOGTLk=;
 b=EZ80dHo0hZM+etqkjmx+XwMg5AE7MrFXHcNNFwIL0DV36F0zFg4uS2uN/gDgc/5kpteacVvSv
 ZuQm7EO0vWmCxG7KI78IBIDtvb+ZLr86rXeq3HPz+mS189K8kJMpzg8
X-Developer-Key: i=hujy652@gmail.com; a=ed25519;
 pk=uXjqvnRsKEfHEyUr63sOg4fEJIDs4AmiW/rB1cWarXg=

> When releasing buffered frames, mt76_release_buffered_frames() only
> sets the bit on frames that aren't last, but mac80211 might request
> it to be set if there's more buffered, and there could also be some
> on other TXQs. Handle that correctly.
> 
> Signed-off-by: Johannes Berg <johannes.berg@intel.com>

Hi Johannes,

Felix already has a pathc fixing this.

https://lore.kernel.org/linux-wireless/20261023111318.2802233-1-nbd@nbd.name/

Best regards,
Zhi-Jun

-- 
Zhi-Jun You <hujy652@gmail.com>
