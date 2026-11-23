Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795430310;
	b=bhN4Cf3jfYXXYogB+7RZa73EMrdTsBpsMkKEpK0msdPe5rRMsUo5X/mTLQaNhSkbl6Sx
	 Ta68eQymxevikGSxeUM6kaJHDBuKIcTawpK/L0EfxeQ9EDEo0xzAxRXjW9MH1pvH5qJRb
	 tXcPHb7e+Yi4N+H9fhfnSmypYCtXDQAILE7T5FjSKhR5qwVjeA3T1oVyUkcpkkSRUSOFP
	 zz+qmLhht6ZlVGnA3CBghB0KNo9BVJZVytnzKgvvekOZSV8cZHHV5K8/ddWoMKUr2ZMk3
	 3NKf0VvJwKZNoimAYUtK5Xx6O5k7ECPl7HxkGsBsMln8WhJLRcDCNxlRNAgNwOs9hnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795430310;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=X8IJJMHUTDpjknUZvu438mfHH0D2MrFt7jxIxN8kIFA=;
	b=nJPc2jG+TXorWVFTso5ujsI/F9399YXp3WglsE0VP8f0yvP3OzPuHkVcGnQG0FbMOLM0
	 goCS/fZmxitxcTwA9lAyoQIPd9g+yFOO8jrw2ztu71TTIBigWo1qxOt6+XsaDj8xFqlwU
	 eCDuGLkvGn77v0SznraSVYN05p70WhYEZ/hswUMEy+CLnpzpMz54ir7CVouTZpwZ0vRAo
	 nXfVlJG6V5+oe9ntDHDoAIekbOPFxqHnexO0UaZHp9gXXaaEw1PNpLTJzThKPQtTtsCiX
	 0RlKDlFuO32yXHIs+Gf/sIDlB2Md+EIRvobmZLlUWTPcXSTUwf9emb8un5NG4Ywr8/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="oz/l00JG";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7110D606A327
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 10:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oz/l00JG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96A601F000D3;
	Mon, 23 Nov 2026 10:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795430309;
	bh=X8IJJMHUTDpjknUZvu438mfHH0D2MrFt7jxIxN8kIFA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=oz/l00JGwaysTrNgoybulVPPLowtDIVKEvFt2jnp+z8nDtvxF95ok29cP6fEAojEX
	 RVgqWWohdFd+1a8id9ITdht2V1EDrvpALXOfkOj+auoQfARoB+/wQCmhwuZa1Td7JN
	 YMDpdm5jzb2PRVzKwujP1OkSKg10n/KrOd7uWAt039HFC7iLahAnrvTR14g8WFrFEm
	 v/10xBr5/sReAgzzz8hneukqFHQY5FA2ZVfljy4X7rBswVaP/vaSrD9hAPXVHFaSm9
	 NgAqppq8oqsGdsSl+/t6hsOJPL0vYfWMRcg9TT03LSINXnxMPHuAD7rEy+rn2eVOXe
	 ZzMJn+SnFUuBw==
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id 922F35FF3F;
	Mon, 23 Nov 2026 18:38:27 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: linux-wireless@vger.kernel.org, RFAREAS Support <support@rfareas.com>
Cc: wireless-regdb@lists.infradead.org
In-Reply-To: <2855A6B0-E021-41E9-8062-93FC37CE0F00@rfareas.com>
References: <2855A6B0-E021-41E9-8062-93FC37CE0F00@rfareas.com>
Subject: Re: [PATCH v2 1/2] wireless-regdb: Update regulatory info for
 Kazakhstan (KZ)
Message-Id: <179543030759.976281.8642865055174093269.b4-ty@b4>
Date: Mon, 23 Nov 2026 18:38:27 +0800
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
X-Mailer: b4 0.15.2

On Mon, 23 Nov 2026 13:17:46 +0300, RFAREAS Support wrote:
> The KZ entry cites the 2015 versions of the Rules for the assignment
> of frequency bands (Order No. 34 of 21 January 2015). Item 24 "WAS/RLAN"
> of Annex 1 to these Rules, the list of radio equipment that may be
> operated without a permit, was replaced by Order No. 564/NK of the
> Ministry of Digital Development, Innovation and Aerospace Industry of
> 19 September 2024 (registered with the Ministry of Justice under
> No. 35100 on 23 September 2024, in force ten days after its first
> official publication). The consolidated text of the Rules on the
> official legal portal adilet.zan.kz contains the same item.
> 
> [...]

Applied to master in wens/wireless-regdb.git, thanks!

[1/2] wireless-regdb: Update regulatory info for Kazakhstan (KZ)
      https://git.kernel.org/wens/wireless-regdb/c/3cca5d20b17f

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>

