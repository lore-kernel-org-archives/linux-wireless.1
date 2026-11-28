Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795880314;
	b=f7rBaVHCHv5h8SiI7x5OGlIciQKwOyRR84l/O+Pfj5hsIBs8ps2cVygWH8DApf4qQ9fr
	 5TKM4sR/1/jAGP8m+T2eq+UBzIJGdNLZCwk+cT1DhXTBWXBIiZxV4JsuqN6r90eTyKliR
	 mLNFQ9BrtOKE4nhj34EHAbGtK3LRSHNvX0s14v7JsflrAdKkW3mny6KSfSovZdHcNsqy9
	 +DGttqOJlcrP9pr7/oyFDtNuE/yJlevxi4xIS96+3lkT8K8VsR6OeV38hJC48Lnxr7274
	 V96qKSyXJEiwsYbVZBWpCFuR6C1o17uRGS8i/YTRoKnmkdeeGE4P8Qe5CMZ9qcD1nxg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795880314;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=dhCVTYBWz+gST+OaWUxVE+PbMNbKqFyh3fNyx1m/uuo=;
	b=mmGFW7EyJRMRqv5F4QMv3cxWEAYbENE/yNg1bDv444XV737gO2CpHB8QF6agbkGeosbs
	 KjbHAYv5QMPcvNGORbBp153ZG/+DrX0vTm310RMh0DyUBr5KU77bdiVwQt3HlIvPWSTwM
	 3vfizpOGVzRkGkZPklQdDjuSDT+ueavgOVgWPqmxbjH3rZoMX/mHSugrPNIrr0nexuHLl
	 p1qv0S721ZIdkE3s33DregaOAyw/yEVnE7dqAP/KuKohwkCJiru8kS5YNkWq+Vtl0+DhA
	 yAgp0q6axF9IJiVIJJvHbY6M92RPDT/w78J9/6Jtz5Nb652PUDDdFgEbV0z36a9otDQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y6p+b0r7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.52
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08C4606A31C
	for <linux-wireless@vger.kernel.org>; Sat, 28 Nov 2026 15:38:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A08C4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y6p+b0r7
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-86298f9267fso4701771a34.0
        for <linux-wireless@vger.kernel.org>; Sat, 28 Nov 2026 07:38:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795880312; cv=none;
        d=google.com; s=arc-20260327;
        b=ROr+uuGOEwpPsvMzwMjkLdwkb5ueWRd51LpeCz8wFZuGKNL+pz+y/WDKHhBOpzcGzx
         d+W/qZY4sarik/HTv8uZA0Fr3VV2SXkuxXW5orq0/uFCWTVvb8dHrZk3kVn2qHyknUmI
         t3oSJK19EIeb8fuvzpUmtLFo/eplLrVIDCVo4FQ54GXPNEphRbuaL9fyCezCWb0r/1VR
         edf08MqZAA76eDXNEDeYFIlgoP8S7I2rHeMMym5+VR049QrfhZkYNYTXoyccAiIk6vei
         QS9cEjpLdNTlhDD8C8WS/pVW+Pj0IuQ8W5w2Il6Q9AvcOC+0V0y9jUhcM4YV8QcEXa5t
         R7dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=dhCVTYBWz+gST+OaWUxVE+PbMNbKqFyh3fNyx1m/uuo=;
        fh=AagyqCY+hxVDb0FB+cKHT1xYauuQkiVuz6hUD0eGhRE=;
        b=YMG5tms29S7vvj12E2y/ajIALH2cKXj5Lp0Fx0g9+91A6QHT/E5YBgpMmzxbXL03KU
         c5MZ6qtNnFXZL7pr7TLsDS/faKscKxO2eYMg0E7eepjOlmt1mB7EUJNYN0Ozuo5MGhM9
         kiwprCZsf1ysULyoSfMfDFIFu5uLJxlKsFcaTx58qo43I0wygOFNbGcK+3DnIgWPMrVL
         00bze8ai43dBvNkAZd+c7wxF+9BfCnxb5famOQDOaGmw5C1iL6Znf6ujvRCIYxrdHNQy
         qfzvgWIUjqDYgZOuSBr7WsT2T6NthBSJcsOjg6IOMGemeqyQ+WTTBDsDzPnmaYZVfaia
         yDcg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795880312; x=1796485112; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dhCVTYBWz+gST+OaWUxVE+PbMNbKqFyh3fNyx1m/uuo=;
        b=y6p+b0r7EKotQa8VXuew2lno0UulYHhQT9rg8+lx3bvR2HmP64rwr/CuCjt5RcdbPr
         O+tALQt49jaJ+lTrCm/ZXydw3zipqYPqcgmF5nwBAQCkpsG1MPblUpQDBQ1OghQHL3vP
         tM5Wg0K3kfjoiKtQrmFS16mP+zkUQ2dEEfkNd252nu6LsxbGAqYLwMiKK1uGTqixPVRr
         P5TihF9QQ9FXf0u/bKta+F4SEzX6qtN1WFk/M4C5qboRuejJ3ulb6DZCz0BtFsX7ngxp
         foGAeBML7zvX+1eO++O0gUExTwzL4s6UZkqfH++/rExxYFj4aMyaShuHtspUSWZWnPzf
         CVfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795880312; x=1796485112;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dhCVTYBWz+gST+OaWUxVE+PbMNbKqFyh3fNyx1m/uuo=;
        b=oHaTh5XFbs4cdXdpKL/yKakbDaNwvYvKQrxREhxbgyJrrVGSOMyKmnZwwK76Gk0clx
         tqGTMM3zBeqtLes1Na0t9kTagVhDCm1Hxz06ySjYai1AIyV+aZ9U40oljqrxi0EhzX5n
         6NwXVAw/u+MHL1NZ5G20x98O5kEIVgy2GXPY7iHFRa6KuvvnRSwXFpF2pr7cIu2h97yy
         ulPfyQPJ277bhx7MSJ+lspSGmTQGDCwia09xuB826ZWlWa0sD4dZEy4d/TOXkC0yU2gR
         kcIAkJDEELA34RU+r7u1X4GjZ96EbMDx1l6wfW8/UeQ6cXHizyXlLsV5umdWkwKI1MiX
         w2MA==
X-Forwarded-Encrypted: i=1; AL+hErGfpZ5aZwlQGKBujlBPtV9LcQj5CXKv+V51Kj9yaGh43VN9Hv065aBXAwi7ATRcWGnGl7ZC8h8YIhVYStJy7A==@vger.kernel.org
X-Gm-Message-State: APuU4Z8QEvNAViuNnmos3hitFrekBI5T82jruu1LojQ6K2r5uX+ALzZz
	lvROu2lK9NrgUFwIZ0pAiyEjkjGxzDQMRUgelOqDaIwd+jLKUozUNwYIonRlze/WgXZAFetHaJ7
	sSEyvR6s1jILdDI/oxGGhEJwo/qOOTxk=
X-Gm-Gg: AZFdTZctVk6pE48ri8jIqiJQuxPOqIjW9x8HoGkUsMJYVXdKbKDi1WLllyZivIFCI/3
	oYsYnOOpRb47/XRkXriS1Cmv/b/p3m2jvWCTpzIn238FeCvH3Xy8fRCNwK6wYazdoPfQOgngenL
	dm7k9DOL/BfF0iaa78Lbq7FTobhZhllU3DNEcJTwdgQNQXvjXUZMuyxlKWcJU1yVOwzZIItRGFG
	qjCYvaxAgI80BKlQr2nKYT3UUYzZiPfHOYFb0PVlHpRT1L64XTxdNh61tauG58+M5lXSvjvp0LR
	0Vx02QVXE+v3OCXgVNcGAH4hjbZHZhPKaYNRKy91Ke1Prqjla06ks31vKUJfdY89I+YYkZjvqpL
	qbtNYUNmLZT4FiFw1zykKwLlWKOIqYSF/rEBKMQOteCSp+5D7c+axvz1AMR3hPr01+22+3gOepm
	/COo2oYN7PiKCBWzKifIeSGbaXrFtAKUc=
X-Received: by 2002:a05:6808:13d5:b0:572:dc48:b773 with SMTP id
 5614622812f47-57a06b1d9bamr30461659b6e.1.1795880312646; Sat, 28 Nov 2026
 07:38:32 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261127180034.1058591-1-hjf3108@gmail.com> <20261127180034.1058591-8-hjf3108@gmail.com>
 <179586537111.18963.13237902807035765522.rtw88-v5-reply@linux.dev>
In-Reply-To: <179586537111.18963.13237902807035765522.rtw88-v5-reply@linux.dev>
From: Jie Feng <hjf3108@gmail.com>
Date: Sat, 28 Nov 2026 23:37:55 +0800
X-Gm-Features: Aa3M54o5T6pUf71cBr3Mxrv8DfhAQrhjMTQ85ErfUYKJkxu9f5oKJgrO94neeFY
Message-ID: <CABOQOSWTTydwz9-fYCApsgzsMf-sBMnGZ1QfkoLEy1YRTAe_kw@mail.gmail.com>
Subject: Re: [PATCH rtw-next v5 7/7] wifi: rtw88: 8812a, 8821a: respect peer
 A-MPDU size limits
To: Luka Gejak <luka.gejak@linux.dev>
Cc: Ping-Ke Shih <pkshih@realtek.com>, linux-wireless@vger.kernel.org, 
	Bitterblue Smith <rtl8821cerfe2@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, 28 Nov 2026 at 19:30, Luka Gejak <luka.gejak@linux.dev> wrote:
>
> Hi Jie Feng,
>
> Thanks for the patch. One comment below.
>
> On November 28, 2026 2:00:27 AM GMT+08:00, Ho Jie Feng
> <hjf3108@gmail.com> wrote:
>
> > -     .set_ampdu_factor       = NULL,
> > +     .set_ampdu_factor       = rtw8812a_set_ampdu_factor,
>
> I think this only programs the byte limit when the adapter joins an AP.
> The only caller of rtw_set_ampdu_factor() is the BSS_CHANGED_ASSOC
> handler. An AP client goes through rtw_ops_sta_add() and
> rtw_ops_ampdu_action(). Those paths leave the byte limit alone, even
> with a single client. On a fresh AP start that leaves the value from
> MAC initialization. The aggregate limit in the TX descriptor is an
> MPDU count. The same applies to RTL8821A.
>
> Is managed mode the intended scope here?
Yes.

> Best regards,
> Luka Gejak
