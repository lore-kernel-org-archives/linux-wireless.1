Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795543209;
	b=TxcG90kJD7djdsK3kXPnuYfigNeTXOfZ6O5SQG15kRss0Aw5cE0ZxgABU4UPb4MX+ezx
	 nNehT0mj7lcQLN/SovUDpgL8RYvO4CAe1Qztiyorg3xFu/ffT3PyYS2T7p2Rid4S6KXYm
	 q5uiNQxfIRbd0HKwb4AmIMBfC2h0DZF373gv7ZUq8bdzoAOYwblLFB00+NMTSBWm1N6KX
	 F5Wz5mMWdQ35agkR7Xcd9svKVFmDkU69x9M13hnAjyN0cc+2J8m7OW+VSxsKXCC5hU+mB
	 oAF5SI+ITxr/0Hjxa26ic00rcxXZIDh+5Wzmp3eN7BTtuz65T6VADm8M6TW0644XziQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795543209;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=8qQL2cawsszFVZraQt84ZZ5nw8FyEzyGMVtNWkN8uGM=;
	b=g+WEA4FrBo5cqPtttvUpkzgw2CHdWvxr+Jq5E7Z8k68wfSx6iOPsg0akVehn96m7ZpvD
	 V8XqPCwRGfPOfAsrSOwwyBMrY3GNg8xP8kuf1pPfq8t294mmmrDSCGvskUQWTQSi1Fvag
	 qlVZ0Qt6Npo5l8YNzI87Yo2OXj70pu3DyaPAOKic8OEtzg1Z35wAmHgpwwFw+7hCyVAGW
	 jjnopin4MsfI+Um34FtMHcuc9o20JOWP35uhYyd/X3BVimE5kmFDqBCzV3knIM6Iku5vT
	 PA32AjYwOO1m5iKWgkEgzcKS4IlDUk6SVNBwTfa41MiE5K6CTHkOLFHA6giCdS/TObg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ECcRAnAB;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE0A606A321
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 18:00:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DE0A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ECcRAnAB
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-380c28f9e35so5989680eec.1
        for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 10:00:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795543208; x=1796148008; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8qQL2cawsszFVZraQt84ZZ5nw8FyEzyGMVtNWkN8uGM=;
        b=ECcRAnABWXwZzPSUNLbCIrMIZxmCOEpitBrAoStUYbzHFiLrOCqNcx1nIqubcarSTM
         r1xMwZgi6imT4Y/IC1o1axRvxuhWHIj2/kg4RvWZb2w0Lut3XVQmVpGHQDsMHKwetW1p
         6WFUy42y6LaJIWnMa1Qcg7kW7TpmyRVYjWRg8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795543208; x=1796148008;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8qQL2cawsszFVZraQt84ZZ5nw8FyEzyGMVtNWkN8uGM=;
        b=fN/ai8tb/xh/T39tsy322mC1NUzMsWcNbM9GnGZwkr78ANPtlba0ghyu+BwaL7p5Ty
         C7HuQAo73tyUcgpdYIu3W4qn3dm0B41QoFYRuVEObA15mk7b6CzamZLpWwM130/5NBLV
         3uX0GMQVaWpVs99OyQgtQRUkgsoUxcXB5PFmwNbLIKDbky19/g7UEMrmSVkxu0I9RuBn
         gDkvFKUOKAj8k1Delgz7v1RcoTfxd1WNVd/oviMMoSOwH2gQL+nzj7kfLdSwABY4lK2f
         rjTQ7Y06ZXRJm7N3YT8NOtk5DPYwBiptBfVPgdm3puiWMxpH2Vx0d/3l2VsE1xGUkhhp
         A3+w==
X-Forwarded-Encrypted: i=1; AL+hErGp61z9jayU2HZXzDfWt1E2FLMnisn+CICnk++drCdzM28crFxRARjt3TAme/DD3DwYEWrw1XwBSDmu5Tl7uw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+voxFxOJRJF21nD+iFuw22p8cHkmhwOBaDOAA1QlVUHO4qLBfK
	sLqEductaSsfAxJeQJuahTDZOt85PQAdJFyLT7vWdBm7C0nJI8sF3ODPABVrHhMHjw==
X-Gm-Gg: AZFdTZfvysy13SGj2iD0PftDjEaadMtlv5OVdYj1lDWmeEBpa6lGzGSo2VbTKUj5X7J
	OYdv7AZpNF4j2EPeeVe//yLpy5K1HCp44euur7WoK46zwLVssb4irt928n3AppaFldIya+m4JLg
	XzwrMZMY24Fn0mEyi0g570oZXcxJ3nqhHc3Gv9FLsTiSCySPtUzZ7WTrnT/VAi6RwzpAQgP52Qo
	cFJqTyJo+aHaceL3J9aRKFZw27qwx+dvaXutQUsHWWZnLxSF55qJJPEoMUOOSPIOAh/m0cWqk8V
	JMZbZLw9QbhBEhwirO1YawCrQGrBd6m+yDI4Sr5HR5yWBWyP/srljqZQbxjUUk+nfa3JJCUYk7J
	eXhMxeRZrB1Hv8g6+EhMAhMG0EYz4t9iNYNxcZngnYx/YeOfotgONDFMI2eslsOoWSCXBb7DX/R
	RrbWl/KOzbWLlGukZnSbWHkyn1zVD5zwSNv71KOZ/Pw+3BVUPAApWj9G5wCcrDV2LUGRh0ALKxj
	taT01R/fGY1Et66+kODOKkRJamfZq5FXM/MBnZ+Dxa2+aEwBW1qreYQSeiC7eb1cGmygSg/aiKI
	9HaWDEG19ttm+aa7lFMOG5DsmR2nCYTuqICFK3AlKvyaObj7BWI2aSkK9oIA5A7l2A0n
X-Received: by 2002:a05:7300:51d4:b0:384:fef7:5876 with SMTP id 5a478bee46e88-384fef75c78mr18248122eec.24.1795543207990;
        Tue, 24 Nov 2026 10:00:07 -0800 (PST)
Received: from localhost ([2a00:79e0:2e7c:8:6ad2:8ba0:aedd:5a84])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-385666e96bdsm43845676eec.7.2026.11.24.10.00.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 10:00:07 -0800 (PST)
Date: Tue, 24 Nov 2026 10:00:05 -0800
From: Brian Norris <briannorris@chromium.org>
To: Tristan Madani <tristmd@gmail.com>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	Jeff Chen <jeff.chen_1@nxp.com>, linux-wireless@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: Re: [PATCH v2 wireless 0/3] wifi: mwifiex: fix three
 firmware-triggered validation issues
Message-ID: <awXQpeeRwME1kVFs@google.com>
References: <20261124174620.1572200-1-tristmd@gmail.com>
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
In-Reply-To: <20261124174620.1572200-1-tristmd@gmail.com>

On Tue, Nov 24, 2026 at 05:46:17PM +0000, Tristan Madani wrote:
> From: Tristan Madani <tristan@talencesecurity.com>
> 
> Three validation fixes for firmware-provided data in mwifiex:
> 
> Patch 1 bounds-checks the TID extracted from ADDBA responses before
> indexing aggr_prio_tbl[].
> 
> Patch 2 validates intf_num in multichannel group info TLVs against
> the available TLV data length.
> 
> Patch 3 caps the TLV-derived length in IBSS connected events at the
> remaining event buffer size, with an additional guard against
> unsigned underflow when the fixed-size header advance overshoots
> the buffer.
> 
> v2:
>   - Patch 3: add underflow guard before computing remaining length,
>     as pointed out by Jeff Chen: when the header advance overshoots
>     the buffer, the unsigned subtraction wraps (Jeff Chen)

Please include information about how you're testing these. (You're
testing this, right?)

Brian
