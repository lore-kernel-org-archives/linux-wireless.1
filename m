Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794273281;
	b=jBMmdzNTLiePUxImBxYcv6yvJ1mX1WRQ2SXUappM6djOPvN0qLueKygjMj4fssCRMIIr
	 PDuoDw+GujkFFZJF+mQwBAILYnlS1Wvxf7splKXFH4GtWk3YqnPTDBTfpdBEsiZ8fD8IQ
	 /TluciLDH8Ty4tOGl0c1MPh+GccCG9ZOC7F3Aeb9NyDua9eG0FQCRJVQi8xlrBmlJtUqs
	 XL6mAQlJ17XxBfNFraBYNO6cO2FwehiBJSzqdBY0w08nMOKlj8u6olFX79/KiXBn21CTJ
	 zcmF50BiFT0VVX1gJtawcbPMDkLg9ZR3NC6nQlS9roTqcktX696IJlvIMQSXfbHFl/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794273281;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=m2qXctBTC0OPADf0V2KkMb6r2GA0JgabIuFAMe6ERzQ=;
	b=n4aJ84USJHk38NP7y/OCabaT/SfjsHaWPfhx46zSSmzZfScC0IEFiZDqjrKKKMtA4eOm
	 AqAheeB/LDXY5NFB2brxxI0pwnHyS1rmGMuHwNGqqdq/NbUcZC6B0oDw4R+XFpiIhLz5Y
	 RA+Q3IWBuEEOrXVqk0Anj8GHB5D1hktRITaYUCiO0I4Su/baUul02Hsn4mhqCHqzxvSLW
	 NPSSiOV3IqIUhWo4uAjH7hmhelFVAVuaXXT3QJGAJxrw4pf5yoaUv89gedFlVfq683icP
	 CHYE1mEz5Enf15gkS3PvylpMi/trJVvYiGplmdZkk7y7cu1+jTAm6nkjETvHc2nVKfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=V+TYKRQV;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73847606A333
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 01:14:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73847606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=V+TYKRQV
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so12463975e9.0
        for <linux-wireless@vger.kernel.org>; Mon, 09 Nov 2026 17:14:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1794273279; x=1794878079; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m2qXctBTC0OPADf0V2KkMb6r2GA0JgabIuFAMe6ERzQ=;
        b=V+TYKRQVmpZ9vxn8BPlLxaUynXS/A5t7zeXzj38hYvT7cvkQ5WviVVSwlNaevoICEH
         5nAclZCnRaNR+MWh7v68n51aEnpe8WEaN8IdClAyigSt3QA18cxTcOd8nmj5I86kZZiV
         ALU8/PW3fftEH+F7Axew8vei23ET/7XFF5oVI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794273279; x=1794878079;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=m2qXctBTC0OPADf0V2KkMb6r2GA0JgabIuFAMe6ERzQ=;
        b=ihoYr876uMNzmtUHL6Nj94ddaHV+Tw2wXFqQXvZhEUru/V7dEUpOE5iVaj7vkk9Dvt
         HYM9z/ez8OGt0vP8uIOhEPCdCnz8sE2sZl/6L1TnTIRt+PxWeYmdiULbfQmEWDxAsAPe
         KlOHywkXWs8ingt2igY8NHcN4Kh8zfWqTr4TCKs1VJ0i4Dj5gBACqQCfALIE7yxiNcc1
         sM63HyWBQGWME8aw5cniMD9x2iDrphiW1X6EgtSOJeLj0Joo7s05NCH+EFWkkX5r55Mx
         mftiKY2TkUt86oTxgrQ6Esd+dguMcrm1rCCxFv8KJwC+hZw2Ajz2Yz8C5Ju4mSaZi3Hl
         KC7w==
X-Forwarded-Encrypted: i=1; AL+hErG9Jo3mfS4ZmW9KTtwvjeHVSymSFuYfcGmn028tMXMedefk0YHLmbt8ttu1i4ZzVYRUABEVgy8+pvFQQaxMYg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9Xr/Ea627/oQSy2Rw7Uj+pGtydFWqY4lRkD5zK/1g//1jjbrwR
	4xOHPv8W0p/YJU9cSSsJWQ+D3KHoxplqh2zdkX26RFWJVptFm1SIcsyc9KdE/+gxqbQFfZ8IF2q
	ORmvx3hWe8Q==
X-Gm-Gg: AYBFou1YAIIUhf7GV8043JROAyZMZ/hShlNTCfm3OvFwtY2wZU2J5EKgv4HRaduxCQ4
	xC3C8pch+slUzWfI2MZYjObM+23bs0S/UfAkX9PWzOnZdhXlBETTlXpjKA3koJDTI+5SJnuxMkA
	8wVuBkYQ2Weu4F1vTYpeBw3hq9OkhCfCeiXJSi4XWBD2e5l4gMMEHpMuXUHaJmSQA6y1CiChnlh
	iRANq5gkxc+VYv4VSz/1K8s9ApERNNw5PZKI1P5nj3xrLaQ2n8RcqEkn4U5f85uUgk/YdtcEbtt
	XTXsklNPTkkpG4/KUz7drsMQKX6G2mBkA+xTlqujtUhfiz6Es2us0E0zV/HOlr+G3BMpkw2NmkD
	IVyNizzgWt99e7CW00xuykGdo0sLb02D73pkiOeZyOXnFjMSww6p8VAiwVHWl0nKn8PFsUmQ+b/
	tktiRL6EKxITAMzlxchubwVKUm7xZUNB47xGi13P3drRx2aX+myR6xDeNmofiXkC7H0qUAd8MgQ
	jnKneHE1Nt6C4NRPtOmcgJsPTwK7TAc0YxcR39dAZEK5T6LcoKkgCgfx1e9JElgxDDEyfm6gqve
	eNgKWtUgyrUA2/WiAaATa3JiQ7OSabXnYyG6FRzY061oz9bYBzOkKhTTekJwHSgRH2u8PaQ3jCj
	nzA==
X-Received: by 2002:a05:600c:4505:b0:4a8:9a2f:d27 with SMTP id 5b1f17b1804b1-4ba0234e282mr14306475e9.25.1794273278804;
        Mon, 09 Nov 2026 17:14:38 -0800 (PST)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com. [209.85.208.47])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49836c83432sm1724253f8f.58.2026.11.09.17.14.36
        for <linux-wireless@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 17:14:37 -0800 (PST)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b577addee9so2031672a12.1
        for <linux-wireless@vger.kernel.org>; Mon, 09 Nov 2026 17:14:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHj3rpKBdDxox3XfJd8+S5nN/bH+j+ISuboyzy/MA4WhHYRO2P7NrJ8mjsfBTBO45vTpM+d/7NCtmU3xYyS9w==@vger.kernel.org
X-Received: by 2002:a17:907:9451:b0:c41:1750:59a2 with SMTP id
 a640c23a62f3a-c50495dfbd5mr87253466b.12.1794273275844; Mon, 09 Nov 2026
 17:14:35 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-work-procfs-core-v2-14-76ace653a773@kernel.org>
 <CAMuHMdVfakapgBK6TBhO1iWX8qzvLDk8jzRS=t2MVa5G=MCUeg@mail.gmail.com>
 <20261107-akteur-gemieden-eckdaten-21304d085e35@brauner> <20261108185953.28054fb3@pumpkin>
 <alpine.DEB.2.21.2611090504170.17804@angie.orcam.me.uk> <20261109214558.0d9d5228@pumpkin>
In-Reply-To: <20261109214558.0d9d5228@pumpkin>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 9 Nov 2026 17:14:19 -0800
X-Gmail-Original-Message-ID: <CAHk-=whsA3tKcUCBJDj_vmJ11rVGT9rivgnKjGRgMO21CPmCxg@mail.gmail.com>
X-Gm-Features: AclHuK-x8jcOOQUqd2amGoGEAKER9jIFGaeL4LxxWAd0cGV7dz_RR64PtDogpPU
Message-ID: <CAHk-=whsA3tKcUCBJDj_vmJ11rVGT9rivgnKjGRgMO21CPmCxg@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 14/23] proc: let procfs copy in writes before
 pinning the entry
To: David Laight <david.laight.linux@gmail.com>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>, Christian Brauner <brauner@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, linux-fsdevel@vger.kernel.org, 
	Jann Horn <jannh@google.com>, Josef Bacik <josef@toxicpanda.com>, Chris Mason <mason@kernel.org>, 
	Jeff Layton <jlayton@kernel.org>, NeilBrown <neil@brown.name>, Eric Dumazet <edumazet@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, 
	Jonathan Corbet <corbet@lwn.net>, Christoph Hellwig <hch@lst.de>, Greg Kroah-Hartman <gregkh@suse.de>, 
	Joel Granados <joel.granados@kernel.org>, Kees Cook <kees@kernel.org>, Jan Kara <jack@suse.cz>, 
	Jan Kara <jack@suse.com>, linux-kernel@vger.kernel.org, linux-nfs@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-wireless@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, netdev@vger.kernel.org, ntfs3@lists.linux.dev, 
	platform-driver-x86@vger.kernel.org, coreteam@netfilter.org, 
	kexec@lists.infradead.org, linux-pci@vger.kernel.org, 
	linux-sound@vger.kernel.org, netfilter-devel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, ibm-acpi-devel@lists.sourceforge.net, 
	jfs-discussion@lists.sourceforge.net, linux-alpha@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-cifs@vger.kernel.org, 
	linux-fbdev@vger.kernel.org, linux-hwmon@vger.kernel.org, linux-mm@kvack.org, 
	linux-sh@vger.kernel.org, linux-usb@vger.kernel.org, 
	samba-technical@lists.samba.org, sparclinux@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-doc@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-atm-general@lists.sourceforge.net, 
	Takashi Iwai <tiwai@suse.de>, linux-input@vger.kernel.org, linux-raid@vger.kernel.org, 
	linux-ext4@vger.kernel.org, linux-modules@vger.kernel.org, 
	linux-debuggers@vger.kernel.org, Chuck Lever <cel@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 9 Nov 2026 at 13:46, David Laight <david.laight.linux@gmail.com> wrote:
>
> Just that the cast would have to be:
>         u8 *foo = (u8 *)bar;
> where 'bar' is 'char *', and I don't think you need a cast there when
> char is unsigned.

.. and just to clarify: 'char' is always unsigned in the kernel on all
architectures since commit 3bc753c06dd0 ("kbuild: treat char as always
unsigned") back four years ago...

            Linus
