Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794883513;
	b=00SMjYXMFEVoutY0tyZshUD9xg9HQjDDiw99nJzMy1+vn2FDAXemZ3cgMAZcAin77Z49
	 dJW5FBd0DuSPdUBJO5dPI6GA3N5uVeh0FB5Z7nIqOtkDB6eIEfBfPtkBZbfaIh3jn6E5h
	 NPuEV2QVNMI0Q5cFChTq0PWinnPRA4r4Zw+MlP/WN2soK/dOYVZ63luHWvvIb8JKLzOgm
	 KG/9QdtW4Pn2HPlz0xoQOtTE3C3PdI8EwSq99Eg7hDdh8MxyUTvUnmsLfK4IyDq86XtpU
	 EcNIGYjrPIfFQMMInQ3wXmZXylYyrU/EWmmVaGVsqo872Q/L5Ki96zwNHQe0OVHlzHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794883513;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=pURlzWm9EJ5C3ayQegmkRNYY/48OUSkAow7ycdxnOIE=;
	b=3qvvJMZz3YBmHX4GGBxjrNfZRG5n1FPrKyFOxgVqiJZTwU1NeGGSxVo5lSIuF48UY2xy
	 l2yP7ovvMKgPKmAYXoY3ks1dLPC0NZf4ivKau+aAawr/pH/WW3Tu9cGOOQ5a5iHYvF56z
	 IpdI2yYevYt2xfR64UPc7kSgIhRw0qFS7mb3SqB3ByyVrXq4UtW4ty/R/NalaTwBZ/epK
	 Qgj57r0Llh1UetcIJ84Ov9RKPKM8rZk4x2qIQVFNR2NamnQCtKqfk7e3ls/KjZqQ7qZCz
	 1yENv4n8y2J4idht8Dojrk9BNz++7sU2adMNIsb2Jln7gn3YEFzdgG8hD+YXYq4b2mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=GiM5kHxp;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E077606A329
	for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 02:45:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E077606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=GiM5kHxp
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1a2761c69fbso322733c88.0
        for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 18:45:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794883512; x=1795488312; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pURlzWm9EJ5C3ayQegmkRNYY/48OUSkAow7ycdxnOIE=;
        b=GiM5kHxpbHlSgBe73EDBEVHyZ8dR4FiqscAYsivOqTIGboQnK69HmSSSI94qxUnUlY
         /4VS6DpYs7r027pRB3TMucojsIyITIju1/Hks59uI9HPgjFotN7njLXCS9NHgLtUoUU0
         /0io4uoIHgHfERHS8WNAUGd4Xsa76xUq5aSvs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794883512; x=1795488312;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pURlzWm9EJ5C3ayQegmkRNYY/48OUSkAow7ycdxnOIE=;
        b=VAkqTnMIBMfD9GCG/UlL7tU/gNeU9aSfzuraUs6eIQvXE9pR3hL33r3pnEomJhQnd4
         SOLm0uHEL5+1ebTrTAonOEA5Db+JHNPVU/jkwe8j9To1zKU+pmbramaIxFeWWogguZou
         swCi0T3ut1gH3wwp9CpIYORDshRC5yCZAHZBHbetGL8O3QoHFNa5QeqdzboTB0LB9kHJ
         KDIeqSXQHi8YTh2lDXTBrt5Ytfs+SFTjWTaYBiKOxSq1lAroH2B3yq3XyfMBIBYNE+tu
         aKMCK106jZuz1uqYn8hIEp23Q6WfuJjADkqpw9Wk6G2+9lH26lo6lRUo7u8RopQAWSa3
         tf3g==
X-Forwarded-Encrypted: i=1; AL+hErEU6xYyALVqfmfMAqAk9vFRSdE0Ae1T0/e8fH1WsK0wVeHiDqpkT1Tp4EW3azxW9yxGjV+eKomAZ9jq/aWDGg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9b60dJnUrtwGBgH9xhKAFQMaGvIvoQKjhFPENVR9v5cX3JwNCj
	nXH7uiZj6UU7NcuvFucSuqRcXEqclCsXGVVsZVqe4VYCxe7glm5mQC6ACiq17boIMw==
X-Gm-Gg: AYBFou0dYfbmVI8b/uAt6VMwrLdv/eVSJUn+yBPj7P+MnFHqGb+8m4q4bl8rrnuLSYl
	UZyvcZ8RdZLbDM3mHLswKIDykk+NxSFAF0ljSyq4uPkui0efjuRjS/kcpqcT4csgJZ/mzlLuf/L
	p0oF4k06Mk7/az7VtI1Swyfv/n9tr5y9dBD81ZzM/KloBl3rMCMKVRMi5dsc9MNSHNnmDzyfMVX
	xf3ZJXlWl4yKo97Wbdenl4T90IkyoFh/wa0tzafztEi1duG0HxA/S+DIouhTktMSH78/7DIsgYh
	50KyJlEUeOAVz4JGLskrImWTBVBW65H/tgB6lZNc6y+HrPbVKMoP1kbzmwP7NYWctEcU0NfnuV2
	UqKtraJ/s6rOX32upPAnrBo1Q80kbL7ECFVpk78OhqrDySOcfq5JfN9SGZueyYuQrguEFEp7e3l
	vPW+Nc8sk9D1wbA8T/LBDnCtMcNit4W2221JMD6xpnS1IAQrhLvkQH6/rcqX/hkqjDj69UAKwJI
	1aO4mv/siy1oeCztrm7l63XZerQnnPO4Wvn/QJxq3bYLoEVT211CKalHzBX0Iipg+whicyHlWx2
	vdB7dkXFH+NrbatjrPyFz7ZJC8Ehwwyd5hyKLg20azyq/LfiRN4u9A5Fihe4llybMt4s
X-Received: by 2002:a05:7023:a4b:20b0:1b2:4e2c:6838 with SMTP id a92af1059eb24-1b50314bed1mr11824518c88.15.1794883511648;
        Mon, 16 Nov 2026 18:45:11 -0800 (PST)
Received: from localhost ([2a00:79e0:2e7c:8:d92d:531b:8d97:bf51])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-1b50319d40asm37154597c88.11.2026.11.16.18.45.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 18:45:11 -0800 (PST)
Date: Mon, 16 Nov 2026 18:45:09 -0800
From: Brian Norris <briannorris@chromium.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: "Rob Herring (Arm)" <robh@kernel.org>, conor+dt@kernel.org,
	linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
	johannes@sipsolutions.net, krzk+dt@kernel.org, kvalo@kernel.org,
	linux-kernel@vger.kernel.org, Frank.Li@nxp.com
Subject: Re: [PATCH] dt-bindings: net: wireless: marvell,sd8787: Relax length
 constraints
Message-ID: <avu_tZSgwxgnLvla@google.com>
References: <20260311194531.70441-1-festevam@gmail.com>
 <177344689795.3706356.13043407533958417879.robh@kernel.org>
 <CAOMZO5BdxG2_raZ--ZrrTn=_i2HKTM=pCB0hWi4+CBRno3DGtw@mail.gmail.com>
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
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOMZO5BdxG2_raZ--ZrrTn=_i2HKTM=pCB0hWi4+CBRno3DGtw@mail.gmail.com>

On Mon, Nov 16, 2026 at 10:18:48PM -0300, Fabio Estevam wrote:
> Hi Rob,
> 
> On Fri, Mar 13, 2026 at 9:08 PM Rob Herring (Arm) <robh@kernel.org> wrote:
> >
> >
> > On Wed, 11 Mar 2026 16:45:31 -0300, Fabio Estevam wrote:
> > > Commit 31ed9d9d71ec ("ARM: dts: rockchip: Limit WiFi TX power on
> > > rk3288-veyron-jerry") added calibration data for the rk3288-veyron-jerry
> > > platform. The commit message explicitly notes that "the length can vary
> > > between hw versions", as documented in the original text binding.
> > >
> > > The current YAML schema enforces fixed maximum lengths for calibration
> > > data arrays, which causes dtbs_check warnings for rk3288-veyron-jerry.dts.
> > >
> > > Relax the constraints for the two properties that have
> > > variable-length data in this platform by adding minItems based on the
> > > actual data used in the downstream kernel:
> > >
> > > - marvell,caldata-txpwrlimit-2g: 508 bytes (from rk3288-veyron-jerry.dts)
> > > - marvell,caldata-txpwrlimit-5g-sub2: 744 bytes (from
> > > rk3288-veyron-jerry.dts)
> > >
> > > The original maxItems values are preserved as upper bounds to maintain
> > > validation for other platforms while accommodating this specific
> > > hardware variant.
> > >
> > > Fixes: 25f855413885 ("dt-bindings: net: wireless: convert marvel-8xxx.txt to yaml format")
> > > Signed-off-by: Fabio Estevam <festevam@gmail.com>
> > > ---
> > >  .../devicetree/bindings/net/wireless/marvell,sd8787.yaml        | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> >
> > Acked-by: Rob Herring (Arm) <robh@kernel.org>
> 
> Can you pick this one, please?

This must have hit my spam filter.

And it looks like Johannes has this set to be filtered out ("not a local
patch"):

https://patchwork.kernel.org/project/linux-wireless/patch/20260311194531.70441-1-festevam@gmail.com/

Anyway:

Acked-by: Brian Norris <briannorris@chromium.org>
