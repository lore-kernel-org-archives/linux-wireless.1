Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=168.119.38.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795527905;
	b=LZbTFhDXYAcMDfQW5ekZ0hIm+0ojrorZNNtqbc1zzw90tRvdMDidJ9HPxY19m9ROe7zd
	 UHQuC5StHT0pxotcE+6gHkMSVCCdkqRw/WBBerMKx29a3Q7l/pybLEv3gFe/H4Azpo54p
	 DRlWUp2BhMufjgMH/ScVj4UKvj3a+DkveST+XaMKiBcwb8pI/kDcglnwxSYvQiegMA5N2
	 lC8JZ0QouepNjezheUuZNcfOMVAVqzsWmu4U/PtOGdATCRTw5KGi6DCE2uZQvZmGMQmRw
	 ngyfqxlXj7KigtlaRLc3qPvGm9SBbybDL8hA6v/1G9jOYxW3MWpPWk1S93g76wym3Kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795527905;
	h=DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:Date:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version:X-malware-bazaar;
	bh=cAS1hmx0PkAsyImCmbWP+CujCvJ+8A6KLaevlJ+N59I=;
	b=FasSJzVPLb7mwXHZSX6qp/QeT6UMlsDIKfd/f7JeNpdf5W041sqlrbp5Ug5z7wwDxG9a
	 aAyPw3D1mZjao+5Egv/TPf3c8lmfu6nmo9jJDAyG/i3EYqS68kM3CGkxuvyRHi32NLgnH
	 pNlFexLR9a1yBmMcXH3n8U6LAkSeoWnPTZ9b4xVG1Jl4wW4PgANugebXE2KYTZLPuE1LF
	 hikOUSGviHd6qYRP+6+ClVrZkTkq97HQLbbf12EJwSFFH7zt/O5XQEeRx+vxD7hp+szS1
	 7MzDHOoJ+22cfPFMf05wEDoZ62v1pC8wsz4K0bHpfjSgRZOuU1IiTmemh9JpT+LY8Sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=permerror header.from=sipsolutions.net;
	spf=pass smtp.mailfrom=sipsolutions.net;
	dkim=pass header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=ISKlQIMH;
	arc=none smtp.remote-ip=168.119.38.16
Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C763E606A326
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 13:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=permerror header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=ISKlQIMH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=cAS1hmx0PkAsyImCmbWP+CujCvJ+8A6KLaevlJ+N59I=;
	t=1795527904; x=1796737504; b=ISKlQIMHyKEJErlkFllyclTdjhSA3t+dj3Tk00lMNKGc9Q2
	Axbt89sBYrKmZRjc2d3356gePCGIT0DKfESsAY9rUq8Q9j5QR826/vcV6HughEjpOVUH/FT3EhJ8t
	T+Rt0NoatjXchK8QcrdWpROu0RHaT+AhF3VKiRQEG99s0jaUFUiytVk4HZRrdPFyKLJm2VV7AosT7
	+Acat5ClT1qHz//4dq3q5XiW4UVd9SSGoUrw5v1nt5kUvMzGcBGNIvH+oSVXOMPFOsWosxrpmYN4w
	eWF7IR8EIsEWLDKWKq2hG8WrLrO9za3caIyL7IX5yzRvaHPXag2THBUHOb5gthCg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__ECDSA_SECP256R1_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1xVqpL-0000000CJYq-1tCH;
	Tue, 24 Nov 2026 14:44:55 +0100
Message-ID: <3e2f80272a55cee22f52f1fae1f2eb6adb01695d.camel@sipsolutions.net>
Subject: Re: [PATCH wireless v2] wifi: mac80211: limit assoc mode by AP when
 there is no auth data
From: Johannes Berg <johannes@sipsolutions.net>
To: =?ISO-8859-1?Q?Rapha=EBl_M=E9lotte?= <raphael.melotte@mind.be>
Cc: linux-wireless@vger.kernel.org, miriam.rachel.korenblit@intel.com
Date: Tue, 24 Nov 2026 14:44:54 +0100
In-Reply-To: <20261022143943.1045238-1-raphael.melotte@mind.be>
References: 
	<94c01af4b987ae7b04aab040d2683edc3262c35e.camel@sipsolutions.net>
	 <20261022143943.1045238-1-raphael.melotte@mind.be>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-3.fc44) 
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-malware-bazaar: not-scanned

On Thu, 2026-10-22 at 16:39 +0200, Rapha=C3=ABl M=C3=A9lotte wrote:
> When user space does the authentication (for example FT with iwd),
> there is no matching auth_data. The connection mode in
> ieee80211_mgd_assoc() is then limited only by our own capabilities,
> not by the AP. ieee80211_mgd_get_ap_ht_vht_capa() thus requires HT
> and VHT elements that the AP does not have, and the association to a
> legacy AP (or to an HT-only AP on 5 GHz) fails with -EINVAL.
>=20
> Calculate the mode from the AP elements in this case, as is done for
> the other links, before the AP HT/VHT data is read.
>=20
> Fixes: 7d8b02592d52 ("wifi: mac80211: obtain AP HT/VHT data for assoc req=
uest")
> Signed-off-by: Rapha=C3=ABl M=C3=A9lotte <raphael.melotte@mind.be>
> ---
> v2: Use a different approach: limit the mode by the AP with
>     ieee80211_prep_channel() before the HT/VHT check, instead of
>     moving the AP HT/VHT lookup (no zero values, no code move).
>=20

Why would this only be applicable to non-MLO?

johannes
