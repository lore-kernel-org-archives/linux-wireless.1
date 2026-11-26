Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795697568;
	b=F6o2pbQPgvKLeF8ZzB5eDc9wyxgJUWp41Uy32lRvnu3ofcJ00YwHKNomcgJ4e7PmINtm
	 mzBuuQ7UZnBM7xcyq9IAkjVOGMxiWNz3n6CVS8yYWQgwNoyNqFmNjCqvhrnUDnUnvPKe9
	 yU+elV0LoGzivkShx5HUx3qW71p8fsSTF9FzFaYM/YepKqDncyssK8eKe7PYiElNhA8Tl
	 NT2BqleBi8jJrc15MpSc8c/KqbEACcKhBT5KQu+QaD+OKMuzpbfILHPAe6RTH6P5F1ACz
	 rUhscUBbtVgadGtdNHXVBDXQlAKT6XpCdivtoFVIdgW1kd8JLsobMQlZVIB5XvEHu+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795697568;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=PVa9ekImbNy0eUOCh+fU0MyKlDIldS/ykE7Tfd4W/ZI=;
	b=Z9aIWiggQSVL8Fe4o+cr2p3RRyzfeuEHCtetkurxAB2fc5Ll8M8WnBKhUt/Uff+gxJqX
	 ViYPAJaRv5n1Wmdlm7AIFcJXqjX88QP6LdHL6GbksmMuHir0uoMeJv4tAyDsNRkYSQnJt
	 BI7oCyhqu6ozOd8p3F2+AdC1RiK/t3I3pB5JdpwxWVMc4pCUoKubZxs9yD/XazJSAGHTZ
	 DK5Rv27iVRh5VHuXQmJuFXnej1OidZKg7FO1P3nJhVse60vm29fv8NbsecPUY8DWAD+m6
	 8ei55uirM6o5KQQ33qlIXaOQh6C+JnR1zc8lv2NKnjgiBDa9n61DaOnYz/8xx+YGOpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=C43ld5DV;
	arc=none smtp.remote-ip=209.85.216.98
Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5AFA606A326
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 12:52:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5AFA606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=C43ld5DV
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-3b40f4d4b5dso3110538a91.1
        for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 04:52:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795697567; x=1796302367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PVa9ekImbNy0eUOCh+fU0MyKlDIldS/ykE7Tfd4W/ZI=;
        b=yKJHdilvXxtyBWTi+Xg+qSbU04CIpBaK3ANKnI6AcIiEwTiSmuCAe5Jvgdx10UjAV/
         dBb6KYonxhRqu5215aTUuw+1ueI44ZOaBQL0FNkaBvRJclielhVMvhaKtMkd5G4OunYm
         qxzBKZRJGZur0D7cnpEkEQEOnARCoPcTpSz6OzwYsC/jaKJ4axoG+NUvS+E5oSOpXcaW
         g0MzKWONefrIsn7RAmQNwJYi9aZz6x2qYtRUxFul2w5g07QdwOMJ/JGNELbrJ1FI5qxo
         paOKfcFq8Jubt7KHE9tAB8rVPGx39X9wlhLv6sd9uS/K6o7MYXmcqrVUgNvNE2kH//E3
         OGkg==
X-Gm-Message-State: APuU4Z8lbmrunoT5tldvSUZSiCRaAEZEDs2tsY7+AmdXIOeXEId712C8
	KDykhF1vKy0A8XttSu2Q/IWPtf58Y4/9mryDshji17QjCueWm+UYooNpfjkGRWtqzFKlOxZB0J9
	ClJc3eleBxT/TB1QrR4RePJ8gOiowmumSgbmybv+rdx6+1wsK7Owuai8NNGBiRJ139fSinC/TWd
	oLiotceAWHSc8P+EcMPWwqZfkSHXLXgjPPA8jN1zsw7M8G4pw4c7y1ms/RTStG5oq1Xi3mbcHje
	bq9wPq18LEoPSy4J+SIczcyKw==
X-Gm-Gg: AZFdTZelRMfbx1SU7g8K3d/LulCMbAbTjhuEGNC06XpYBzSXQ83Wr1R67QqtMv37YZd
	+WpSIS5HLHS62umAaKlh9yrsrU348GtMIw0yJZYTh6EibmIKW8++nzRfJIJ/q2Y67+zA/+bF5iL
	mfWbIrSjgH+yIvySmsqixmM3vYBd1OUKPtvbr7qksfkKJLc6JN16MDsioWLPs/fihaVZlsG7M3v
	zoHSDWY/CebkaZxYNKTP6h538Ssww0/eN8vAS2OCwV67nI188R0jK/Il9AuWZzxrv9FXAL1C+ux
	Xq2UYKvJLzeES3I22VwzItZmv6wU0/f3kZDs8VpdSa+39Q2jF+/em1NBg+lzRls6T/NAagpB3Cv
	lM/06IDe6HIVMQvrgoPk4qlbe2N49PVoqfzCECyTEj19g3Q2KVSyobDsZKMZjK9HY2sp3Yk2bj1
	olWm/6wQHIrgXhd1meBBywiJghfrlnqDwwO7ot40Q=
X-Received: by 2002:a17:90a:d2c7:b0:3b4:1a5f:8664 with SMTP id 98e67ed59e1d1-3b41c97aaa0mr18376289a91.65.1795697566964;
        Thu, 26 Nov 2026 04:52:46 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b4062e6c29sm15608702a91.7.2026.11.26.04.52.46
        for <linux-wireless@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Nov 2026 04:52:46 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-948d83322f6so549497685a.1
        for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 04:52:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795697565; x=1796302365; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PVa9ekImbNy0eUOCh+fU0MyKlDIldS/ykE7Tfd4W/ZI=;
        b=C43ld5DVjh0EFQDGc8CsBRsGWj+Xv+RtyfKrgD38ggGjJUJQDuXl3eMavsdm/O9LEU
         KCZAmMAOjlwiwmqhVWf0H1BOsGl1ZLiDYU+mhidoHBOhFqB4Ry++iMir6ZQRXCjNhh10
         bXi8aJYIOyBqHr4d7LZrEaYYI0yw0M14N1wSw=
X-Received: by 2002:a05:620a:460d:b0:93f:4d4e:ff6b with SMTP id af79cd13be357-949ba81a543mr3602883885a.12.1795697565582;
        Thu, 26 Nov 2026 04:52:45 -0800 (PST)
X-Received: by 2002:a05:620a:460d:b0:93f:4d4e:ff6b with SMTP id af79cd13be357-949ba81a543mr3602878285a.12.1795697564924;
        Thu, 26 Nov 2026 04:52:44 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-94a0c18267esm311983385a.4.2026.11.26.04.52.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 04:52:44 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Tristan Madani <tristmd@gmail.com>
Cc: linux-wireless@vger.kernel.org,
	fariyaf@gmail.com,
	linville@tuxdriver.com,
	kvalo@kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH wireless 1/2] wifi: brcmfmac: zero-pad SDIO write to 4-byte boundary
Date: Thu, 26 Nov 2026 13:52:40 +0100
Message-ID: <20261126125240.958940-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261102122311.181075-2-tristmd@gmail.com>
References: <20261102122311.181075-2-tristmd@gmail.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Mon, 2 Nov 2026 12:23:10 +0000, Tristan Madani <tristmd@gmail.com> wrote:
> brcmf_sdiod_skbuff_write() rounds skb->len up to the next 4-byte
> boundary and passes the larger size to sdio_memcpy_toio().  The 1-3
> extra bytes come from heap memory past skb->data, leaking stale kernel
> data to the wireless device.
>
> Zero-fill the padding before the SDIO write.
>
> Fixes: 8f13c87ccc49 ("brcmfmac: Split brcmf_sdiod_buffrw function up.")

[...]

> ---
>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c | 3 +++
>  1 file changed, 3 insertions(+)

[...]

> @@ -323,6 +323,9 @@ static int brcmf_sdiod_skbuff_write(struct brcmf_sdio_dev *sdiodev,
>  	req_sz = skb->len + 3;
>  	req_sz &= (uint)~3;
>  
> +	if (req_sz > skb->len)
> +		memset(skb->data + skb->len, 0, req_sz - skb->len);
> +
>  	err = sdio_memcpy_toio(func, addr, ((u8 *)(skb->data)), req_sz);
>  
>  	if (err == -ENOMEDIUM)

The padding lies beyond skb->len, so this memset is only safe when
skb_tailroom(skb) >= req_sz - skb->len, and nothing guarantees that for
the skbs reaching this function (e.g. a data skb in the non-glom path).
If the tailroom is short the memset overwrites skb_shared_info. Please
check the tailroom (brcmf_sdio_txpkt_prep_sg() does so before it adds
tail padding) and handle the short case, e.g. by expanding the tail.

Also, the 4-byte rounding of the length predates the commit in the
Fixes tag, which only split the function up. Please point the tag at
the commit that introduced the rounding. The SDPCM header carries the
unpadded frame length so the device should ignore the padding bytes; a
word on the actual impact and how this was tested would be good.

Regards,
Arend
