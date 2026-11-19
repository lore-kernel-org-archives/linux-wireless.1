Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.145.95.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795088838;
	b=dOe1APzKQWIT3ExleGFFad0NYiWEEXPplZT13Odqn3OAr9rcNWOhThjkcSR0fUsASYqQ
	 OcXcebrMD48RZJW+7xr41U70Ks0/PjnxQEwQeIEfFNjPd/KTHcHYUXDZ5zaSnUmOLkTZL
	 AUTU1eRoE/moHsslNoY7TG8AEI5NfoBvtLWE3nNCxcDIWFjiZAaXoW+VLLYjB6+zME4Zo
	 uLZOyAvPlRdL8H5dhq3hAS/kcmsYSahU/sXKzsxZwYrH9vigkpQXv5bQtlaHyORYbWFXS
	 yzme38NDIg06jNnpa9hEnbLF9uZOl2S3FT6LZkMp7w4B+WBVboYq2Z1TbL1OLqT8asw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795088838;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=9jAArRtdynxwcEac+ToMSg4h1xX6IgxBc9Pfb9YCUj4=;
	b=B774OiS7KeyNLp1LOx07/g+O/bXQwS5Rd0A16G69Z7kI1gSRx7lQwz/Itq9iWxPK11+0
	 balbSx5x+eU+PoVRyKmEZ979xZs51Y6qdAYQ/r/M6AVgULbacsKU9jHZIZmHjUkDjbkTd
	 YB+5UQjqEDB4cf0oqFC41BUjLOZsHNH3BJNpZRx9wGJ/iVbuJsh+KcuaP95kqKSlaluM0
	 V7AA2mTtcNPAM4lWz4M8NEDVJf1x2lOtNsAn63VNJKgzDXQGqHxCeFVWub5uge3Xe1huM
	 J9zZGQNpIUgBmStGW+MgTa+CHHlW0EDURQSa2mWyA9LCY9sKOHgsUnKt6JHKRmXFRiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=toke.dk;
	spf=pass smtp.mailfrom=toke.dk;
	dkim=pass header.d=toke.dk header.i=@toke.dk header.a=rsa-sha256 header.s=20161023 header.b=AdHlblX9;
	arc=none smtp.remote-ip=45.145.95.4
Received: from mail.toke.dk (mail.toke.dk [45.145.95.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6441160A260D
	for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 11:47:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6441160A260D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=toke.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toke.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toke.dk header.i=@toke.dk header.a=rsa-sha256 header.s=20161023 header.b=AdHlblX9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=toke.dk; s=20161023;
	t=1795088836; bh=HTN+pinHQWCz4EiCAvXGa6FC2QzTx4PDI/ZoRWCYLpI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=AdHlblX9DAfBw+SKtiv3nmleHDYsw1RnLWxlLGMS9mfGYYtw6CtBEjF1AXHJUc7LD
	 o87xHd+GsHKEm2V0YnsaC469XU0dxXWVOCKZ1muOTXbXIjrhlcr/HaPseEzBgjgV1d
	 YG5NM33PNIMM7kV1VdwxG4VKPdi9ZlTg6+hvIqJvXFM2wQIrh1wcOKVxHBvqvKkBqs
	 mqZe127sxHQSnzzCKzD0sD2oVNX8MHR9WX4PdN7tmKst66rYIN6HTRkuHCjTR0x6i+
	 HWEhkYOwCSIzdwnGJm1PUIIreNg6lqQLuH8BtwZjB5QzJshXpCEx2/+hRuUdzGeTeV
	 fT3CEKKQIeGCA==
From: =?utf-8?q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
To: Dominik Engelhardt <dominikengelhardt@ymail.com>
Cc: linux-wireless@vger.kernel.org, Felix Fietkau <nbd@nbd.name>
In-Reply-To: <20261110170459.31857-1-dominikengelhardt@ymail.com>
References: <20261110170459.31857-1-dominikengelhardt@ymail.com>
Subject: Re: [PATCH ath-next] wifi: ath9k: let mac80211 handle filtered
 non-aggregated frames
Message-Id: <179508743392.131763.7343734922147557265.b4-ty@b4>
Date: Thu, 19 Nov 2026 12:23:53 +0100
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

On Tue, 10 Nov 2026 18:04:59 +0100, Dominik Engelhardt wrote:
> wifi: ath9k: let mac80211 handle filtered non-aggregated frames

Applied to toke/ath9k-pending.git (main), thanks!

[1/1] wifi: ath9k: let mac80211 handle filtered non-aggregated frames
      https://git.kernel.org/toke/ath9k-pending/c/b1fd0a400f4e

-Toke

