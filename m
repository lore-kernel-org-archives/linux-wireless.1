Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794865753;
	b=pVbDwroTC1fkSTl2DuY2V7f6inbBGftfpGWfhGZyDTBJOuDFGOHi1SkIaWyCA4yI9B1A
	 Dlt5nd63mqjaVCNh3qOyqQ3MRcAuh7fOgxteaWFSN8u5sY9gVH/70uGnjthyq/cbmYd+c
	 ay0VDJf5no8SXNAZQmzmQWZTnzM3y/FoYcrCEFYmup6Z7UoeK2amcUpAhj06hH4KdIP1c
	 ZP1KOWeHLjrKtrIKeu454We+FhH/4VR4ePDW7M6GyA+48+GRPkZyhO6eDTjuJ5lIdDDt7
	 qdL4S6N9F4QCHxzdkJwPdL6FNzhIlRGlCcmVX1K+sXZkIYhXsHH6MybAky/EzmAge4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794865753;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MWS9HuyyNmrnPfnUOwmph9d5xBJHBzx5A67xlVtIv9M=;
	b=CcCDoSX9xZO8I2YJQLS89nHAnyrFX74g7m+w7XJSrC4pn6cwgkgQ6qnEUTnGezd/P8du
	 TGj9Sb1UPoeK+XJPy3efrp13OfnVGQKt2Lkv6onM6zfqUr44Rhcka4zy3/lSmOyFRuaAD
	 hwO/naqm7q7y9xffrUUhQJRm7EaKbNPMVrxck13MK6jj8MOrUzQ0kpjVrVpKHiQlvyBPU
	 0dfOyyp4Y7YwzLeL0vDWqPN47gShVPvcOzi+bImfYMI7+a2100QCqaKzmqEeKvXh9eOuG
	 uOy3825s4Njs+nipL+RcSBW6TZQxq+VJDv6+D6rWnqkO+uQj09MI3tbYAXcONW7hnEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d7JHDbwk;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F1F606A32A
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 21:49:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62F1F606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d7JHDbwk
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso41177685e9.3
        for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 13:49:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794865751; x=1795470551; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MWS9HuyyNmrnPfnUOwmph9d5xBJHBzx5A67xlVtIv9M=;
        b=d7JHDbwk9VEEBpl0ifoxlONZ+rcxz3lAMH/W2wIUaMRsM79hzjnd1QcdK3mtEVeq0p
         54gr2ZSz+kTtofnFVXmVydA09j/Eyv1JBsDTOlYKZcxFwYiz94TWnzN4rgYpe/7OlE+a
         O2rP4G0F3lyI5MRIFXt1rObFAHHn+WhS/cTK1WJJzlvkVBfi6lFajp0Tszyem3hXcsIG
         hxaj3JDAtoEXyhp7sTvMMnhtH1sBO8NPSn0HODnOHpi1qrzMjPa52+uoO2+Gq+Q0BN/Q
         gYKR4XnkDpTFS9Q0hyed8/tblKEm5WQOWJnHyztcXRVbSHvMgKZ0Yy8NuLTY2wIzgAvL
         I7uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794865751; x=1795470551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MWS9HuyyNmrnPfnUOwmph9d5xBJHBzx5A67xlVtIv9M=;
        b=c9D2glNJHPrbpXOUovyBrJkC3zamIjMdRo6y+lyFZVzOlyX6G59MEuWw2YBycEffgT
         oiW5nphBmW/EGH2JEAAyF5XWSAU8V0qyjLkCew+8D3N1cuQ7FxtyTCEUkTB23nGDPKb5
         s4IjEZeVwrZrtzWC/r1NKEH98o4vixcqaXmcpZ+uJQHMOwnpN73vBGLNB4tDuOhHTgxR
         Flk3tz2P00o7C1NYA5C+IlMJCXjF65jTxpEzU1V1ihpWRp3OeNkqvOmxwEBi53Y4zsvs
         Mx2DHo8Bk60S3zziFc09tMjL5kI/UhJISd6tPc9FH5DBcBrz0sfTxOcgAnCKaMzpTf3i
         sD3w==
X-Forwarded-Encrypted: i=1; AL+hErGJiHC1HoJbQkAGfEYOY5q7XLwc5gfANRDECwes6dmWyo0YwXPowV23Q5F1K+P3b/DvKooeMwMBw9gPg0rQLA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8VDjvqEUDl0ChP9QSDu4umBahGjtHi3e9CazSvE88Kc/52ktAd
	cqGW5U4caLmnXlq2dkGeY6XtYcGtjZvW0dY08wI0iH+hje8Pi93z9V6zWkLjfURI
X-Gm-Gg: AYBFou2g6rUDpKdJ3BOc2t/NX+HmNklXhPc0g2j/EWBs6nC5tIWsXj5WosdOi9OmTr1
	qN6Is+WDCTLUlzm3/LskvAguUSzigqPD/4QInyYPgpnh+i/8L2qdPd3YhLfal0T6IZJtCsrAGzl
	NYDyvCh3udU+fO6ZwVfpaqqhpoA8U2hmWGBTa0btu1zPdQ357k2hluLmZLc3aYZwzhjbK5VfFY1
	VP9NEB5vVG9hxNXvFw3Sciwm679BY8njASMcF935bE69O+DdY1NCpo+0DnOm0Y05k5t67A73Kps
	1q2qjYDrgXIuPkdfhHcILJgAtwM/r0oWHjY9MPXluSS/8J3Sbmrf9XLTmfVI5ryhMLiC+zAYtqo
	8LzSt/uBOovy7DZ/sR8ez7OtTPPkxT4pIRnu5azelH/0IvJKBaWH1z1OJnlganMQ+BgimVBgm7W
	pdbXx5oQfz6VW95rO02Qze5KPMEVLN3pAw56zuB2ApaZbmu0d3q4VX0azF3s8Hb43+G6xYsPPfk
	tZlVA6GpZmf6wHXSqEAw9vnCCofb6RrH1laR3e3pNtRiB9UoOC0RZvE0hHhLb9RFi8ppm0JT+FS
	mqfbwF6nOqaqtsmTMGt/V1K9S+34/x2HaDc=
X-Received: by 2002:a05:600c:34d0:b0:4a2:133:45e1 with SMTP id 5b1f17b1804b1-4bb55a59f41mr248892725e9.24.1794865751381;
        Mon, 16 Nov 2026 13:49:11 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7843bd79sm16434045e9.14.2026.11.16.13.49.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:49:10 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Luka Gejak <luka.gejak@linux.dev>
Cc: Ping-Ke Shih <pkshih@realtek.com>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: Re: [PATCH rtw-next v11 2/3] wifi: rtw88: support channel switch in AP mode
Date: Mon, 16 Nov 2026 22:49:09 +0100
Message-ID: <20261116214909.1569237-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <59C03074-784F-41CE-A27D-EF3F30773D77@linux.dev>
References: 
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

Hi Luka,

All three are right, thanks.

> Could a failed download keep that count pending for a retry before
> allowing completion?

Yes. v12 downloads the same count again at the next step and calls
ieee80211_csa_finish() only after the count of 1 reached the firmware.
With the first download of a countdown failed on purpose and a count of
2, v11 switched with no CSA beacon on the air in 5 of 5 tries. v12 sent
every count in 30 of 30 with counts 2 and 5 on an RTL8821CU, an
RTL8822BU and an RTL8822CE.

> Maybe the refresh should not depend on csa_vif still being set?

v12 refreshes the page in rtw_ops_stop_ap() whenever a station interface
stays, and the work no longer clears csa_vif, only the driver ops do.

> Could the AP be found without allocating an entry?

v12 keeps the interface of the countdown in rtw_ops_suspend() and starts
it again in rtw_ops_resume(), without iterating.

Mehmet
