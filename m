Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794594306;
	b=ms5pg/Y8AEZoCR7qh/gWiQW6PwTm1SlBlUXiOd1OX3o55sniknwKRNIXRX2938X7d8Mw
	 78Th8ItqE7tAlJ+9X+QacHKD6ZZP85g5ySyUZYzwKduyNXcP96hfFq4vY4xB5JA4LAYcH
	 yo7bx+NJPuZMVOHzr0G3AqumwLg35V1YIvLBipNMNdXIt93t485BgLMPNj+pqifWQu7Oe
	 Y5PHoX+1GutA4KmVKVn6uxLwkcFcXFbMUhqgXJXxmg5Emo6zTsDa6i3VJxsQlkMFS2AQV
	 uQ4z0fznUpXWkvN1SFnAEkj9DLI7zbuUaGAyqKFYpUM8pPnBanil0YBc9LWACEK4dYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794594306;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=+4+M6Qf8kgsKLvqCkp78aI5bxXP1So+oEpWQ/VILqxM=;
	b=VtDSHyDVIrw8TjjsREyhEa62r8SdqEukesIoVk9wjZFSS5TYYfJszpJYxG0CXT6Wc4hp
	 c7inm5vlLoBW/YunKt5vAtlLAMPTyKEajWKP/mJi4j1HFAyrZs/HP4krdKk9rUBkOIrTu
	 +PuTOvgXWlV0VwSpuR5ezZDs9gyRdWjCE1UV1Iz0+lSoizINWp3uAE6oUU6YLL2IeW+pB
	 /+ppggWeVhf3CmHAYh21Gbi4AZWL7GHMoXGkSH/52JPPd3rUD/TfR1GJCFw/YG7AtPD7i
	 mrsmxtfxmhtNYWSxyBuR7rrcN4oDsyHb8H8c0MuvUOmeXPTqUwBnLGof13S7g4hIUDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gompa.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.161.53
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434FB606A331
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 18:25:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 434FB606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-6d290b10a35so479530eaf.2
        for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 10:25:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794594305; x=1795199105;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+4+M6Qf8kgsKLvqCkp78aI5bxXP1So+oEpWQ/VILqxM=;
        b=rV+NdG8U8+X4jEEyNplN6yteOtiYzsTcJutqZHobZ4mR2aek1cpGP/UVFmLLNKXTAc
         838ac2u0i3B22fPDXbgFJ8LL5htJKsg9bjQ8GFKIdcLqSD2fdchkfXQTiIgYm2xD+J7V
         UR109/rr6bAqFwQhYx9LmRXl5j/HzV8pxe/10ClSZNCQbCesbVDj4ALB+X7LTK9B5Xdi
         htUcSAkStoc+R1DSPMptxL+a7CPgrHVfhDsDbximBzas2VcSJknWvFSJ5WSxdAlp9ZgI
         5GNuczXnMJRHCOOzNSa8xidxTpdILNDhMeIybn5Gy+FBJVvcosNcltpbJpZsWv5xCs1U
         03JA==
X-Forwarded-Encrypted: i=1; AL+hErEgGPzi7b/ZGGpF6o8ZG0CLoG1GbHNL+Kx48rl9ISBLo2i2RdkbPVopFlzRF9rdpPEDYhj409TAp6Vp9AkJBg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/zHTnRRao10f/AGrJMEqXjkvrm4RhqVq7fZ2dUrT+p9r9QSEjU
	fygpy9VdvQ12U1JT81oQyPWMcfWDWnAgelV1Rx7VCYKK9UzEpRZZuh/5dqyT9Q==
X-Gm-Gg: AYBFou1jUn0hDN9y83dRlO3IMABxq4ZLCPBhpcOUD6R6lnSysW9lH280Ob+IbUZVuWE
	Ji913UZZcMzSbYWNJ9B46kYWER1bLCdxfakGZVJyVDiPCD9cuqjoJXMrPJRByWBbNiksl3Z2CWh
	B1C8FNLAQdnU2sNx3RUQmcANqvYTJBWalouQE+8CxsoCXw0WAFM3P0Ct1l9gyoeogBvzfvRK3qD
	yfntKKMvSdn36V+prfxG+dOR5ufvU7IpiBREygnRX7viHaWtNQWrQcfJhobzqiDFE5orZRJzc5e
	y5m43rokyxXMJ8DwU/N2odwwcI8WstL0N9e7dOApgFG896wSklhODvg7HMvav3C+XF+Ewv2gbzG
	pRAhzHnWDYW4Hnxam0VXlB0IFItXiigqLQ0IH1kYm482jG8UVdDKVRYosv8ctafhis09iT6ReFx
	6moPk516UBVYU6VSQqHRvxr9iGdagrKBJYeDA+5LR2v5tVRuCBIqjPBEXj9KPV0+dTpX3nzz8s8
	iGGOBztizTQUb7EhkcDs7+u4z5HiE34Ty4M0dXh8aWwdjihqk/p2qd+4moLd5Eudd3tLFdde2ID
	m7ZdgmVRvxGBDL4Cgd9Ng0sLFswYurSDx4jceZac1oO4B2/Xw0BEIr0MeppOVPAr4NH/fIbRObh
	vKWUDA4SJLg4ySBRCZTbN+FGB0xVc9IDzhM7ukp0f2xdCWHFJ1bObupvefkCw4ae8ELHPJrW1A5
	Dn
X-Received: by 2002:a05:6820:c0c9:10b0:717:da:ba2c with SMTP id 006d021491bc7-71ab50def31mr1393774eaf.55.1794594305114;
        Fri, 13 Nov 2026 10:25:05 -0800 (PST)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com. [209.85.210.51])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab3f44dc4sm2303842eaf.0.2026.11.13.10.25.03
        for <linux-wireless@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 10:25:04 -0800 (PST)
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-8628b63dd60so393784a34.2
        for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 10:25:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFQMe8UcZnUp0f3elYQKkdVdkFkUfgc882hgrFwLhaGPYFpMTfIHCDE9IkWHz2R122UJbtrCVlRZO9dcAOOOw==@vger.kernel.org
X-Received: by 2002:a05:6830:2695:b0:83f:f24d:fe19 with SMTP id
 46e09a7af769-8628979e65cmr3203276a34.3.1794594303480; Fri, 13 Nov 2026
 10:25:03 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113-6ghz-v1-0-0b9a67e413a9@gmail.com>
In-Reply-To: <20261113-6ghz-v1-0-0b9a67e413a9@gmail.com>
From: Neal Gompa <neal@gompa.dev>
Date: Fri, 13 Nov 2026 13:24:26 -0500
X-Gmail-Original-Message-ID: <CAEg-Je9XODS=vU-tjZev90Rng6D_B+9vxek96mV8yUpXwoQ7GA@mail.gmail.com>
X-Gm-Features: AclHuK9fW5jJ3rn5jJzhWh_iZufJsywX71GMdWHbE-bhsHtoOzuaNfj98eY9hCo
Message-ID: <CAEg-Je9XODS=vU-tjZev90Rng6D_B+9vxek96mV8yUpXwoQ7GA@mail.gmail.com>
Subject: Re: [PATCH wireless-next 0/4] wifi: brcmfmac: Add support for 6 GHz operation
To: michael.reeves077@gmail.com
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>, asahi@lists.linux.dev, 
	linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev, 
	brcm80211-dev-list.pdl@broadcom.com, linux-kernel@vger.kernel.org, 
	Daniel Berlin <dberlin@dberlin.org>, Yureka Lilian <yureka@cyberchaos.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 4:20=E2=80=AFAM Michael Reeves via B4 Relay
<devnull+michael.reeves077.gmail.com@kernel.org> wrote:
>
> Hi Arend, all,
>
> This series adds support for 6 GHz (Wi-Fi 6E) operation to brcmfmac.
>
> It includes HE capability advertisement, 6 GHz chanspec and band
> handling and PNO version 3 support. The PNO support is required to avoid
> channel-number collisions with 2.4/5 GHz during scheduled scans.
>
> It is adapted from our downstream work in the Asahi kernel by Daniel
> Berlin, but reworked to make the code cleaner and more maintainable.
>
> As I don't have a 6 GHz AP to test with, Yureka Lilian tested this
> series on my behalf, on her Apple Silicon M3 Mac (BCM4388). Connection
> and use of a 6 GHz network was successful, without regressions on 2.4
> GHz or 5 GHz operation.
>
> Thank you for your time,
> Michael
>
> Signed-off-by: Michael Reeves <michael.reeves077@gmail.com>
> ---
> Daniel Berlin (2):
>       wifi: brcmfmac: Add support for 6 GHz chanspecs
>       wifi: brcmfmac: Add support for the 6 GHz band
>
> Michael Reeves (2):
>       wifi: brcmfmac: Advertise HE capabilities
>       wifi: brcmfmac: Add support for PNO version 3
>
>  .../broadcom/brcm80211/brcmfmac/cfg80211.c         | 477 +++++++++++++++=
------
>  .../broadcom/brcm80211/brcmfmac/cfg80211.h         |   2 +
>  .../broadcom/brcm80211/brcmfmac/fwil_types.h       |  68 +++
>  .../net/wireless/broadcom/brcm80211/brcmfmac/p2p.c |   6 +-
>  .../net/wireless/broadcom/brcm80211/brcmfmac/pno.c | 147 ++++++-
>  .../net/wireless/broadcom/brcm80211/brcmfmac/pno.h |  41 +-
>  .../net/wireless/broadcom/brcm80211/brcmutil/d11.c |   7 +-
>  .../broadcom/brcm80211/include/brcmu_d11.h         |   3 +-
>  .../broadcom/brcm80211/include/brcmu_wifi.h        |   1 +
>  9 files changed, 585 insertions(+), 167 deletions(-)
> ---
> base-commit: 3c311bf321442d4c4f452a1a08bc9efce242a1f9
> change-id: 20261113-6ghz-a8d587ab3cce
>

LGTM.

Reviewed-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
