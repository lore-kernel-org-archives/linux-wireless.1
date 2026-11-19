Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795084684;
	b=gUd4nFtoANbTgT7aZDc9H7cdqomSASjG4sNmaUodbVKpUKbNgomJEB6Ex4yKnBIBjSEN
	 kAIzpoBUtVUWAuj9X3We1ct5J1Db7/ajbHahShtP1rFtzRM598t+yPTmwuL8PT3KVi85K
	 Z1Vb0GsdaWjsmwNdkcvEoRZl1Cwhg+z+Syyw5OPSj+qXYb17OS9zEpaU27Xp6pq9KV9GF
	 fHMGCBZ8fKdCV/twgnGPQg3Vh3Q5KbBxGz8VQbNTXq0ePoKAUI/oZd/LK7HXZcgoJV0RL
	 NTYlQlMQ+Qbduzbpha9SWdph8fclo9/P4QCCb0vdrca48kq/DGvlQ/3qVulqqFWhDBA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795084684;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=D+9N4aioXVI29LS1qOtYPEdWRjnfXn6CSLbyGCX05wY=;
	b=CaZ+tPXhlwH7G2mEqJu5Z3P8WRPUdOa9VLPCYwpt4erSWlKED3Muasu/HlVCNEX6r9xy
	 MdCpeTPYPUY7+VU9Zl9qhpqPBT05Jd7EOAtCLymVhW8cxpadWQxP21dD0i4/jfqGApout
	 +QBnqNPzi89SRDFRqeEMLDmM61wOlm2q1gv0t4U8TMdJIII/jbPrG4xHPeqU1SMXnt8TV
	 ag/49NdYbhE5fW17p1yzcx9MlrB7YW/I+t3VclbbP2OKb3o9p1+vps7FXTYsofILrzfuT
	 cXwuIl/9GUpbfOmXZnMOFIrGicf8NX1TXhPrpvKKP5yBiUsAk++uJXfJG/uj6z4W4uA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ieUQHX6Q;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.48
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80AD5606A33E
	for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 10:38:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80AD5606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ieUQHX6Q
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-71b0d330acfso549857eaf.1
        for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 02:38:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795084682; cv=none;
        d=google.com; s=arc-20260327;
        b=a4WoKb3d8iQNKxs8vY+xWHyorBmJHQPzllDlahKGkw7bikSqWXrsLLrLviK6s/ivyj
         po4LGyuS3TjfiZN6DX4Pg8pWbcT1CS44J2D9pkw/OaRRLaIMWZUNg/jkBGe8y5vMTqXe
         aaNwImWH+fizu3Z3UwJX3hpEbZuGW0xnmCDZ2b9AzMvXR9n5D4qFRdy8iS/F8n+sZKO1
         R92K71u/YSrXs2ekW+KtuAnlMYv25bwCCGqXW90OAgKLzW+xVWFVd6NbLqJzf2GlQsm2
         LThn727TKkkVSudcOrB6DxCJp6WjyjzLz/1DI0uURXg47xzfi4ZY7z3ql8ef+SJ/nVLQ
         /Kmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=D+9N4aioXVI29LS1qOtYPEdWRjnfXn6CSLbyGCX05wY=;
        fh=SJx0sZw/TpGiUCc2s3YwanEn3aWKhGHEyyVp197tjOU=;
        b=PZOxm8SP1J5Xawfzvz2i5P4QIXNPjXjfwLX+MmLFblVeiLMo5zw2YvXbkMfx5VQAkt
         Y2/zIIZbSuz8UcBjtQ/Y+9tdSM3tT7ReVhfDZdGykAdnaMlLTFXL0Ap+G8+v3rwiays7
         Aiy3/+vkiRcXudGN/UmVl4lGeLIawOmggCPW1yr7VRmyuKKrJwUvMyoJPGhskW5Wv1JM
         gVLT1c6F0sn8e0h+Am2Ak2WkewX1uk/H2lJnMAod0cxJdw2flEsGE+8r81fnt6qc0bEh
         RxR2eG2YZeGBnHldcMmvCZd5jAubSSKBWWwN2TmStDk9GGIGgkxEJG/YyxfZWKW9tSIz
         RMFg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795084682; x=1795689482; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D+9N4aioXVI29LS1qOtYPEdWRjnfXn6CSLbyGCX05wY=;
        b=ieUQHX6QLf6iTmC0DbjLZz7BRLlxhx2BHTHROvprwyJcrqfwujYKXAeRlA9+MgqpjA
         sFJOuGor6IY4YwImLPim8uov4K7xw3k1PUwyBHOaADbmS47wnEwQgdNc6bBDQG5YBDov
         tBSYLFG9LedITsu/0v5zvc/JxeZ6Xf8qxoTiKNC9ykPgIH3Jb9YtA6/I0i7zeCM0PHwO
         mHQDkYrwKuT4CFABIfoTilFd25yOhoVCJ55f5mtaaDG7bgupRJy6IcVkuRIHwFozxRiL
         d7xlM40R315wFMkwLRaFlq7hft3IDiMAI0KMS3E7nW9Fl51nrCbwFu62GDulsdR4eGJ/
         DDDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795084682; x=1795689482;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=D+9N4aioXVI29LS1qOtYPEdWRjnfXn6CSLbyGCX05wY=;
        b=ujiWmkNlPKvBdIF5PwHimlL+Uc5GWj9BHcSweCLIq5eWRgFoFHmqpLVOQX0ws/mLmZ
         gCyHwtKXsA7zJ6xnPRR8zQrZrv4QvEQ1X3T7yUcbJXjzzUbARFR5iNvOPxQKpQwmWkMB
         2XTIsk6BYPx432zBsEm+HRK2CYnxsv0zXYaMNsOk6FqYA04HWZ1Y5U2h1FdO7CaquRdI
         aCtJW6VNxTpEXzqPDb27yFDcGOzezI9D/H7X7+B7CMXlsW01cnr7ik4ip4U/4Db728pF
         swdpi/odgYYWQNqIt6X1f0K+SF8TN2TKKMQa4kPPwzIF7RPoDrSOefsNadPr0VphIU8u
         9vWw==
X-Forwarded-Encrypted: i=1; AL+hErEr++KdCJ8Z+ytoS9aWg9W2WEYn88wLLBxSZvys6/oujtYVH1P40NAJozoA2WmPWYUWc4pef/KkvH70hIBrgg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+BRZ7gvx/x6ZCYfmYaZ8YEgCXwqPZlPHZjJ2rfa3jm+PKF19n5
	V7NccRRT/+eHfQ85YAjKiQN2R69zhFl0rUgHw5wLviOZvytOqY0k/ZaWBjYkE1fNV7igRYAo2YR
	vEF5Z5Lme++q5Tva5Uj6BffSqjtUBkk0=
X-Gm-Gg: AYBFou3hFtja4FxD9VWp/J0F8NPYCZMMTtNw3mxmalQ+37K40hfzV7ZNFF7l2nFoVAt
	yMPqYmL+Ly384jqCEOnZSyL8gG/+QP3CV8AhBfsB4TMOERa6EOFDTlcf4vMy+BIxOP9bg1EiKJz
	yQku9o7AYZJ2vUwcCg8IIWgXFnO/6WDCEU36KZzg6cYvk7RVtXbss+YN/pWMFvP6ytlY2El41vC
	mGlOoWjXpKxCXvRFg5HT4f5xXdBvH15OHp8GLmDObaWJnA3onmlqfxYN45IupjFSNOkgCKJ66Yc
	bvPF/TTBwiPXAG48vgJzTF2CFHptExzArH8UJtclb2oKS14NPn7Usshm303dff5krdRUi+xBdoa
	6cdH9wLklxoaROJ6R9GqKVKySeLFy8QrsY7cENxjSoQ0xmzjCTqCIC1XREOiPCSXZRhPevv99jX
	aW96j4UXOzzmPvdbwWDLXNegR22/UZ9A==
X-Received: by 2002:a05:6820:3503:10b0:6cd:3fdc:2664 with SMTP id
 006d021491bc7-71b3267b3d6mr204785eaf.37.1795084682370; Thu, 19 Nov 2026
 02:38:02 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112050816.2795512-1-ragulbaby@gmail.com> <20261117125204.3992696-1-arend.vanspriel@broadcom.com>
In-Reply-To: <20261117125204.3992696-1-arend.vanspriel@broadcom.com>
From: Jie Feng <hjf3108@gmail.com>
Date: Thu, 19 Nov 2026 02:37:23 -0800
X-Gm-Features: AclHuK9pB0av0B2Ec4fhz9yUKq6D5l_BFPjgXFCn4ODJXfmSjZymkoZ_qi1RZTA
Message-ID: <CABOQOSVNZ0M7u80pCMOSTFH8vW2eAYQmcJKowdtTubj0-bLagA@mail.gmail.com>
Subject: Re: [PATCH] wifi: brcm80211: move the USB bootloader definitions to a
 shared header
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: Ragul Balaji <ragulbaby@gmail.com>, linux-wireless@vger.kernel.org, 
	linux-kernel@vger.kernel.org, brcm80211@lists.linux.dev, 
	brcm80211-dev-list.pdl@broadcom.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 17 Nov 2026 at 04:52, Arend van Spriel
<arend.vanspriel@broadcom.com> wrote:
>
> On Thu, 12 Nov 2026 13:08:15 +0800, Ragul Balaji wrote:
> > The Broadcom USB bootloader downloads firmware the same way for other
> > USB chips than the FullMAC ones of brcmfmac.  Move its commands, states,
> > firmware header and response layouts from brcmfmac's usb.c to a header
> > in the shared include directory, so that other drivers can use them.
> >
> > Signed-off-by: Ragul Balaji <ragulbaby@gmail.com>
> > Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
> > ---
> >  .../net/wireless/broadcom/brcm80211/brcmfmac/usb.c | 68 +---------------
> >  .../broadcom/brcm80211/include/brcm_usb_rdl.h      | 78 ++++++++++++++++++++++
> >  2 files changed, 79 insertions(+), 67 deletions(-)
>
> [...]
>
> > +#ifndef      _BRCM_USB_RDL_H_
> > +#define      _BRCM_USB_RDL_H_
> > +
> > +#include <linux/types.h>
> > +
> > +#define BRCMF_POSTBOOT_ID            0xA123  /* ID to detect if dongle
> > +                                                has boot up */
> > +
> > +#define TRX_MAGIC            0x30524448      /* "HDR0" */
>
> [...]
>
> The move itself looks fine. Like the series "Move brcmsmac code into
> brcmutil in preparation for brcmbmac" (posted a few minutes later), it is
> part of the reorganization that has to go in before the brcmbmac driver
> is sent again, and nothing else in the tree uses this header yet. Keeping
> the brcmfmac and the brcmsmac parts as separate patches is fine, but
> please send them as one series with a common cover letter, so the shared
> pieces are reviewed together. Since the series then touches more than
> brcmsmac, rename it to something like "Reorganize brcm80211 code into
> shared directories in preparation for brcmbmac". Can you clarify the
> additional sign-off from Ho Jie Feng? Did he co-author the patch or did
> you use his (earlier) work?
Yes, the driver was co-developed with me over a few months.

> Regards,
> Arend
