Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794167735;
	b=cBIlyKQhv0j9hNKWHOeZ+balHu6FqlBdtL2N5YEoistH9ARPIyy3gjhzP13ukKNagfod
	 Ro0LuupWg9GBqL24FKsAy6Gb9w6uD50KEra8YQ63HPYR3jubwL7FLsoNGdXnaDu963b0x
	 8371OKe2OUPUYbNeZBcKpgNY9N5lHAbSzKe9zhym10lVTn7muDEJFNN0RQ/F0arVV1XOl
	 1iKJ2uGxB76Xfc3C8/EqciN31O9HHeS+uFXx0vKDkEGeqQ9sBcXYITEgEM67rmq0trvAe
	 iirRNhTQKjYRJFrE0aNUeS93ZnVvOOPniWwcVIquS3V+FAKAeOeJsLXbh0iqfvgN/vQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794167735;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=ljpPnIJB5gvEueSlqHLmqJGlOso//lAKmsQSBJB5C1Q=;
	b=twN7l0ttLoUtAYskSSGHZ960K+urdQH8ulqRloczdeXb8YE705GeX260SVLKVzDhEOgT
	 BKZEE+hTPh+E9ybqJQt+JhQJqu5YJQSTREWGz/VBk1ZZkjG7g1ipe2EFugqDnbbt+xgw/
	 XR+b6PRLn9mOHODIzuzcvzByrJxrGNNh42UdhoS0rTT3NRQawoz8/2mJLiQgaGthSBy7N
	 mp0PIkmwDE1gD4gDkGQSkBr2vZqTt3s6V9Hq8kTk6SIxBhigqWadXHkxfRNjQqNalWzGQ
	 CM7og876vcxu/+obS5QSuk0nI/M+G4uDykoLN/pvtgdWmkIqxpTK0AX0PZOuAy40uyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=KO9yVkPZ;
	arc=none smtp.remote-ip=209.85.216.100
Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8680606A31C
	for <linux-wireless@vger.kernel.org>; Sun,  8 Nov 2026 19:55:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8680606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=KO9yVkPZ
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3b0bbdeae06so99461a91.1
        for <linux-wireless@vger.kernel.org>; Sun, 08 Nov 2026 11:55:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794167734; x=1794772534;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ljpPnIJB5gvEueSlqHLmqJGlOso//lAKmsQSBJB5C1Q=;
        b=JjlHofZk4Ek/+GbPZgwJlIqpJw2s3SNFmjp3xPbQk/pFeO8TRxW/U/pnE8VBHw/zmb
         Y/u6kznSgURBEO/xCIghV977Dj1RNhzAYWtoelE5JAabI6/s8c2o3flBRrGUNw0kf982
         RYw3V3L711PhjleUiwZRdt/STA6SCqgnD1lg1Y/CLbrtowoJi66P6QvVB29LdRS+EitX
         jtTaUy9uEDF1uq+UbCQsB7jipJhnFdiDQ+Zp2QXRk25ykQt057CaUgeCNuqivx2ch2KR
         cioQ1I4dLHWcT/vpm0ReS8zu5afy4WJvkMcEWxZJD+C7u1YrJm5yLuPah7XTBEh6hYQ0
         QDAA==
X-Forwarded-Encrypted: i=1; AL+hErHvQkob77pit4SHuQwDXfitKtkIYjocY2bqJEF0AvkoJVfxeuqRsgO5O0A7UeojXU5mls5UMHKnAd/0vFb2lg==@vger.kernel.org
X-Gm-Message-State: APuU4Z95fUvNq18NotdK6dseycG+hZ39y7hS6nQ0FzPhkfyykfQRGFUO
	QsgOdIzqkErYGDjlQCzuuEywehmrCiHwWFzvdMfmzS9JkbMX72c65IS5LoVcP5Hn4Y53OVLM4C0
	vZvkCsad/tqCtSNVtM8XJYQAOiUMeMZ1macHlOW4/kHqUNHrjWfJGbR9k5Njjb030SNAjXGsTxS
	q6/EzrVF85CNclhXVo166v9286Sn7EdFwXBEdWtpuUOK7/ahItcQWD4UxGixx31lOh0tIhW8OTD
	y22fHPMm4I18wz5R4cfOUPPfm3t
X-Gm-Gg: AYBFou0wrtr4TpquIRGcp0y5oQeReRlY23OdmMTSGklgN7kRYL906DXPfTEXg4yW+ZD
	iT+wzQHK8Ni+oh36nVdJ1dmrdww6EBSXziGKwxQl2dR8Pyzy5xhDMKPwc17G5SBJddycRFKYovo
	O/uyDRT/SztcTIwD9RvvN79R/swW7Tq+iRKOIX85ctE8fbMU7/fVrfnDCG2X/fyTWEbjNq5mP1u
	K+y0N5z8tNhs0aq2TYgKX9mG/oolqasS0gqZ63bZXTjuphQ/u9k+IHHFVBvzaWgfCo7R55uCDyu
	QZykg8PLVnjNEvpUCk1J9r8oLU9sGYDGdRBMBlgv29i8GjbdtEBJnSaMxcF7q1OZkxeF+stiAQ+
	1Z+tuRMkjJsiJN2ErXE7qOWr++7bA65MtSX8KTomKQd5BQgHoUDCc4MCJ8IkHltWA43EHs2P9CE
	C4M6I028roCCFP4X3YSLw7+w03bIhVTlUsPBITbn8=
X-Received: by 2002:a17:90b:57cf:b0:3ac:8446:c1a5 with SMTP id 98e67ed59e1d1-3b12d4698c3mr1794049a91.48.1794167734057;
        Sun, 08 Nov 2026 11:55:34 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1058d4f27sm4326034a91.3.2026.11.08.11.55.32
        for <linux-wireless@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 08 Nov 2026 11:55:34 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c49b95262a5so15625966b.3
        for <linux-wireless@vger.kernel.org>; Sun, 08 Nov 2026 11:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794167731; x=1794772531; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ljpPnIJB5gvEueSlqHLmqJGlOso//lAKmsQSBJB5C1Q=;
        b=KO9yVkPZaLDvsOUPSUecHbbKPVZMSZLr8FdgNkI9u7MCeqVy6UECHgPFHNHtqWN9Sn
         ZHDUAcRJEdQSYDCxV7sA/Td98SIZQGGS0yhsUyO5eO0OKZaSj2YDeJgt4gyzNiZQIClo
         frSVlyHQzu3OKUrg5rDASM93h3EUefsETLd/4=
X-Forwarded-Encrypted: i=1; AL+hErG3FWjklUCNbJs4WtFwbkkp5A4NDRbHfL8vX3Dh9unFzXA79EcM1aVYgXkXXBqOALqnUtsraUjaJxkEQrC2ug==@vger.kernel.org
X-Received: by 2002:a17:907:9805:b0:c40:33d:f06f with SMTP id a640c23a62f3a-c4d6d7bf946mr154128466b.39.1794167730972;
        Sun, 08 Nov 2026 11:55:30 -0800 (PST)
X-Received: by 2002:a17:907:9805:b0:c40:33d:f06f with SMTP id a640c23a62f3a-c4d6d7bf946mr154127866b.39.1794167730515;
        Sun, 08 Nov 2026 11:55:30 -0800 (PST)
Received: from [192.168.178.26] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a998a75sm81315866b.73.2026.11.08.11.55.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2026 11:55:30 -0800 (PST)
Message-ID: <f79112b0-d4a3-49a7-aec7-190ad4951bb1@broadcom.com>
Date: Sun, 8 Nov 2026 20:55:29 +0100
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH wireless-next 00/17] wifi: add a driver for Broadcom
 BCM4323x USB adapters
To: Ragul Balaji <ragulbaby@gmail.com>, linux-wireless@vger.kernel.org
Cc: Johannes Berg <johannes@sipsolutions.net>, brcm80211@lists.linux.dev
References: <20261026053633.361454-1-ragulbaby@gmail.com>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
In-Reply-To: <20261026053633.361454-1-ragulbaby@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 26/10/2026 06:36, Ragul Balaji wrote:
> This series adds support for the following 802.11n USB adapters:
> - Broadcom BCM43231 (Netgear WNA3100, Dynex DX-NUSB)
> - BCM4323 (Netgear WNDA3100v2, Belkin F9L1101 and others)
> 
> 
> The protocol was inferred from USB captures of the vendor's
> Windows driver, cross referenced with code from brcmsmac, brcmfmac and b43.
> The code which are copied almost as-is from the referenced drivers
> are indicated in the comments of the code
> 
> The driver supports:
> 
> - station, P2P client and monitor interfaces
> - HT20 and HT40, A-MPDU and A-MSDU transmission
> - 2.4 GHz channels 1-14 and, on the BCM4323, 5 GHz channels 36-165
> - hardware CCMP with management frame protection
> - the LEDs and the WPS button
> 
> Power save, AP, P2P GO, IBSS and mesh interfaces and hardware
> TKIP/WEP can be added in later patches
This is really old cruft and it is a different driver architecture. 
Within Broadcom we called it BMAC and when we upstreamed the brcm80211 
drivers this architecture was already going to be abandoned. The term 
BMAC is also found in brcmsmac code base so it is easy to see where the 
split was made for the RPC interface.

Generally speaking I am a strong believer of reuse, but this series is 
touching the other drivers more than I like. I would rather split it in 
two series so we can apply the patches touching the existing drivers 
first and assure that there are no regressions. Then add the "new" BMAC 
driver.

Regards,
Arend
