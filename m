Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795570120;
	b=zz/Apb76+cyDGXAzudK5qz67ByelP2DoYL7bOD98JNmJWnBjsAWQ0S3UqR1glkQAkvnk
	 sO3QP+06OBL5xj0R2Szr8DY8k4qNkNp0v5CEhCkyOApEdHfzZpSkHOcaXI8pUD/iETLPP
	 DaZLpXDaFoSbnbxyg518AMOEOIlWxtTspoP9AmsYeOgojhmfnzKZo6i//jhK8ycJHI9vQ
	 t+ucqxjYRFOsf0gUc67C2T7qtBhTpRG4SAyqah+JoDQTBMW5u+RVjpTOrUQ6Q0qwE2GVf
	 YZbRVqXZzeGeS4Y5Hc2OQdbuR5wpLGGJlufrOzjaAtchgFWkY2V7TbElgUVcMAhj9wA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795570120;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=/kcw1pc7QfhqDg5XVpmffRI63tTo22+MVCJZidEBFCI=;
	b=4Drmrq5iYcQop8OPoKSOabSA17lA7nPanjyD0jNI8rkR529iRbz0DjgZR5o4PhhgfWnp
	 aBnRBbVFLD2yfxlb4VUFIbGXbrbPt3brHmOlJ4O9AEeDjNMmGw6rpCeTel3REwRuR/Hff
	 WD69ppmn31jXei95AG5zXEQoo6foyx8FE+8SAtWJenMmwuiy+PYwXO1JMKGMH7jNOa8ZF
	 Jb07sP8pxwXYbYg2ubosYHS+mARwB6z+Vxu5EjCj7mxsFk//h91FtNSS54nNifO2LP2En
	 NCyumruvGde0griPV1uJxYMd17vd5lWlSdS3rRSSjBo4yVx6/QvU22lZ5XpeW260F0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m4BMf1P3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6161606A684;
	Wed, 25 Nov 2026 01:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m4BMf1P3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 488D31F000CF;
	Wed, 25 Nov 2026 01:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795570119;
	bh=/kcw1pc7QfhqDg5XVpmffRI63tTo22+MVCJZidEBFCI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=m4BMf1P3cldnyycCPFODYxzbBPzETCKba97Mx8R1iU0U4fY7CSZt6Vvac6wzLrdGQ
	 aTEB2KZSEbzU81gdatZ+WmEYrVyOg12/4MJN0EBZAI2WpGQDrQju3iXbTocEgizfwo
	 CVSC0AQZ1IRgAW2dYYlTnhXzYcdqXff8A0hp95DAOVSUX/T5T7xuAWyfBUZFYD3LHl
	 L6/Dqeb0Ni2IFIg4TKNIJ5gyKP1my8G/JSDY4sztIQ1yk8gAbQU4cl7z2Wtwz5aeie
	 rUVIzluf03jVbWe/q2O37ytK+SQbbIb0v03Y5JhBPiZ3wNP56/FXRfrdOA4HqEROib
	 m4hw93e/h0utg==
Subject: Re: [PATCH wireless 2/2] wifi: mac80211: widen the mesh IE offsets a
 u8 cannot hold
From: netdev-bot+sashiko@kernel.org
To: piyus@iiitd.ac.in
Cc: johannes@sipsolutions.net, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kapil@presceralabs.ai,
 kuba@kernel.org
Date: Wed, 25 Nov 2026 01:28:38 +0000
Message-ID: <179557011887.3135.15766992632445342222@kernel.org>
In-Reply-To: <20261124003526.78471-3-piyus@iiitd.ac.in>
References: <20261124003526.78471-3-piyus@iiitd.ac.in>
X-sashiko-severity: Critical
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 1 · High: 0 · Medium: 0 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Critical] The fix rests on a false premise, and it makes the series'
  beacon-tail heap overflow reachable for the largest RSN IEs.
- [Low] wifi: mac80211: Fixes trailer cites 2b5e19677592 instead of
  082ebb0c258d

--

wifi: mac80211: widen the mesh IE offsets a u8 cannot hold

This patch changes the locals in mesh_add_vendor_ies() from u8 to size_t
and the RSN element length in mesh_add_rsn_ie() from u8 to unsigned int.
The goal is to stop values derived from the mesh IE blob length from being
truncated. The commit message says this is not a memory-safety change,
because the preceding patch makes the two builders cover disjoint ranges.

> diff --git a/net/mac80211/mesh.c b/net/mac80211/mesh.c
> index eb54bd98f282a..4ab776e174d9c 100644
> --- a/net/mac80211/mesh.c
> +++ b/net/mac80211/mesh.c
> @@ -354,7 +354,7 @@ int mesh_add_vendor_ies(struct ieee80211_sub_if_data *sdata,
>  			struct sk_buff *skb)
>  {
>  	struct ieee80211_if_mesh *ifmsh = &sdata->u.mesh;
> -	u8 offset, len;
> +	size_t offset, len;
>  	const u8 *data;
>  
>  	if (!ifmsh->ie || !ifmsh->ie_len)
> @@ -377,9 +377,9 @@ int mesh_add_vendor_ies(struct ieee80211_sub_if_data *sdata,
>  int mesh_add_rsn_ie(struct ieee80211_sub_if_data *sdata, struct sk_buff *skb)
>  {
>  	struct ieee80211_if_mesh *ifmsh = &sdata->u.mesh;
> -	u8 len = 0;
>  	const u8 *data;
>  	size_t prefix;
> +	unsigned int len;

[Severity: Low]
The Fixes: tag points at 2b5e19677592 ("mac80211: cache mesh beacon").
As far as I can tell, that commit did not add the u8 locals this patch
widens. It moved the beacon-side calls to mesh_add_vendor_ies() and
mesh_add_rsn_ie() into ieee80211_mesh_build_beacon(), and
mesh_plink_frame_tx() kept calling both helpers as before.

The helpers themselves look like they came in with 082ebb0c258d
("mac80211: fix mesh beacon format"). That includes "u8 offset, len" in
mesh_add_vendor_ies() and "u8 len = 0" in mesh_add_rsn_ie().

The truncation predates the beacon caching. It also affects the peering
frames built by mesh_plink_frame_tx(), not only the cached beacon.
Should the tag be:

  Fixes: 082ebb0c258d ("mac80211: fix mesh beacon format")

instead? There is no runtime impact, but the tag decides which stable
trees pick this up.

[Severity: Critical]
The commit message says:

  "The extra IE blob a mesh join carries is bounded by
  IEEE80211_MAX_DATA_LEN, 2304 bytes, and ifmsh->ie_len is a size_t."

Is that accurate? struct ieee80211_if_mesh in net/mac80211/ieee80211_i.h
still declares:

	const u8 *ie;
	u8 ie_len;

struct mesh_setup::ie_len in include/net/cfg80211.h is a size_t.
nl80211_parse_mesh_setup() sets it from nla_len() of NL80211_MESH_SETUP_IE,
and the policy allows up to IEEE80211_MAX_DATA_LEN. copy_mesh_setup() in
net/mac80211/cfg.c then does:

	if (setup->ie_len) {
		new_ie = kmemdup(setup->ie, setup->ie_len,
				GFP_KERNEL);
		...
	}
	ifmsh->ie_len = setup->ie_len;

So the buffer holds the whole blob, but only the low 8 bits of its length
are stored.

ifmsh->ie_len is never above 255, so the vendor IE case in the commit
message (vendor IEs starting past byte 255) can't reach
mesh_add_vendor_ies() as described. The truncation still happens, just
earlier, at the struct field.

If the blob length is a multiple of 256, ie_len becomes 0. Both builders
then return early and a secure mesh drops its RSN IE.
mesh_plink_frame_tx() in mesh_plink.c also sizes peering frames from the
same u8 field.

Widening offset is also not a complete no-op. When the vendor split
overshoots the truncated ie_len, the old u8 offset wrapped and a few bytes
got copied. Now nothing is copied.

More importantly, can the wider len now overflow the beacon_data
allocation in ieee80211_mesh_build_beacon()?

validate_ie_attr() checked the element chain against the full nla_len.
ieee80211_ie_split_vendor() steps through the blob by the real element
lengths:

	while (pos < ielen && ies[pos] != WLAN_EID_VENDOR_SPECIFIC)
		pos += 2 + ies[pos + 1];

With a truncated ielen, it can step over an element that crosses the
truncated end. It then returns a prefix larger than ifmsh->ie_len.
mesh_add_rsn_ie() then does:

	prefix = ieee80211_ie_split_vendor(ifmsh->ie, ifmsh->ie_len, 0);
	data = cfg80211_find_ie(WLAN_EID_RSN, ifmsh->ie, prefix);

Take a 257-byte RSN IE (length byte 255) followed by a 3-byte element.
That gives nla_len = 260, ifmsh->ie_len = 4 and prefix = 257. The RSN IE
is found, and with unsigned int len all 257 bytes are emitted. Before this
patch, the u8 len wrapped this to 1 (and 256 to 0).

ieee80211_mesh_build_beacon() only budgets the truncated length:

	tail_len = ... +
		   ifmsh->ie_len;

	bcn = kzalloc(sizeof(*bcn) + head_len + tail_len, GFP_KERNEL);
	/* need an skb for IE builders to operate on */
	skb = __dev_alloc_skb(max(head_len, tail_len), GFP_KERNEL);

The skb_tailroom() checks in the builders only bound the scratch skb. Its
head is rounded up by the allocator, so its tailroom can be much larger
than tail_len, for example on HE/EHT hardware with a long mesh ID. The
copy at the end then writes past bcn:

	bcn->tail_len = skb->len;
	memcpy(bcn->tail, skb->data, bcn->tail_len);

The preceding patch, "wifi: mac80211: do not copy the mesh RSN IE twice
into the beacon", argues that the split returns an element boundary not
past ifmsh->ie_len. That rests on the same assumption, so similar layouts
with smaller RSN IEs look like they already overflow there.

Would it be better to make struct ieee80211_if_mesh::ie_len a size_t to
match mesh_setup and the nl80211 policy? Rejecting setup->ie_len > 255 in
copy_mesh_setup(), or clamping prefix to ifmsh->ie_len in
mesh_add_rsn_ie(), would also work.

The "Neither is a memory-safety problem" statement in the commit message
may also need revisiting.

>  
>  	if (!ifmsh->ie || !ifmsh->ie_len)
>  		return 0;

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261124003526.78471-2-piyus%40iiitd.ac.in
